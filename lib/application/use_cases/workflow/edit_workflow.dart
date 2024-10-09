import 'package:okapi/application/interfaces/workflow_repository.dart';
import 'package:okapi/domain/workflow_entity.dart';

class EditWorkflow {
  final WorkflowRepository workflowRepository;

  EditWorkflow({required this.workflowRepository});

  Future<void> execute(Workflow workflow) async {
    await workflowRepository.updateWorkflow(workflow);
  }
}
