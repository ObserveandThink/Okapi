import 'package:okapi/application/interfaces/workflow_repository.dart';
import 'package:okapi/application/use_cases/workflow/create_workflow.dart';
import 'package:okapi/application/use_cases/workflow/edit_workflow.dart';
import 'package:okapi/application/use_cases/workflow/delete_workflow.dart';
import 'package:okapi/domain/workflow_entity.dart';

class WorkflowController {
  final CreateWorkflow createWorkflowUseCase;
  final EditWorkflow editWorkflowUseCase;
  final DeleteWorkflow deleteWorkflowUseCase;
  final WorkflowRepository workflowRepository;

  WorkflowController({required this.workflowRepository})
      : createWorkflowUseCase =
            CreateWorkflow(workflowrepository: workflowRepository),
        editWorkflowUseCase =
            EditWorkflow(workflowRepository: workflowRepository),
        deleteWorkflowUseCase =
            DeleteWorkflow(workflowRepository: workflowRepository);

  Future<void> createWorkflow(Workflow workflow) async {
    await createWorkflowUseCase.execute(workflow);
  }

  Future<void> editWorkflow(Workflow workflow) async {
    await editWorkflowUseCase.execute(workflow);
  }

  Future<void> deleteWorkflow(String id) async {
    await deleteWorkflowUseCase.execute(id);
  }

  Future<List<Workflow>> getAllWorkflows() async {
    return await workflowRepository.getAllWorkflows();
  }

  Future<Workflow?> getWorkflowById(String id) async {
    return await workflowRepository.getWorkflowById(id);
  }
}
