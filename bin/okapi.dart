import 'package:okapi/application/controllers/workflow_controller.dart';
import 'package:okapi/domain/workflow_entity.dart';
import 'package:okapi/infrastucture/repositories/jsonrepo/workflow_json_repo.dart';

void main() async {
  // Initialize the JSON repository
  final workflowRepo = WorkflowJsonRepo(fileLocation: 'workflows.json');

  // Initialize the workflow controller with the repository
  final workflowController = WorkflowController(workflowRepository: workflowRepo);

  // Create a sample workflow
  final sampleWorkflow = Workflow(
    id: '1',
    name: 'Sample Workflow',
    taskIds: ['1', '2', '3'],
  );

  // Create a workflow
  await workflowController.createWorkflow(sampleWorkflow);

  // Edit the workflow
  final updatedWorkflow = Workflow(
    id: '1',
    name: 'Updated Workflow',
    taskIds: ['1', '2', '3', '4'],
  );
  await workflowController.editWorkflow(updatedWorkflow);

  // Delete the workflow
  await workflowController.deleteWorkflow('1');

  // Retrieve all workflows and print them
  final workflows = await workflowController.getAllWorkflows();
  print('All workflows:');
  for (var workflow in workflows) {
    print('- ${workflow.name} (ID: ${workflow.id})');
  }
}