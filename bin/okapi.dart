import 'package:okapi/okapi.dart' as okapi;
import 'package:okapi/infrastucture/repositories/jsonrepo/workflow_json_repo.dart';
import 'package:okapi/application/use_cases/workflow/create_workflow.dart';
import 'package:okapi/domain/workflow_entity.dart';

void main() async {
  // Initialize the JSON repository
  final workflowRepo = WorkflowJsonRepo(fileLocation: 'workflows.json');

  // Create a use case for creating workflows
  final createWorkflowUseCase =
      CreateWorkflow(workflowrepository: workflowRepo);

  // Create a sample workflow
  final sampleWorkflow = Workflow(
    id: '1',
    name: 'Sample Workflow',
    taskIds: ['1', '2', '3'],
  );

  // Execute the create workflow use case
  await createWorkflowUseCase.execute(sampleWorkflow);

  // Retrieve all workflows and print them
  final workflows = await workflowRepo.getAllWorkflows();
  print('All workflows:');
  for (var workflow in workflows) {
    print('- ${workflow.name} (ID: ${workflow.id})');
  }
}
