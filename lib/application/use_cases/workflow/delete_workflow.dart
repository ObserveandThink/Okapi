import 'package:okapi/application/interfaces/workflow_repository.dart';

class DeleteWorkflow {
  final WorkflowRepository workflowRepository;

  DeleteWorkflow({required this.workflowRepository});

  Future<void> execute(String workflowId) async {
    await workflowRepository.deleteWorkflow(workflowId);
  }
}