import '../../../application/controllers/workflow_controller.dart';
import '../../../domain/workflow_entity.dart';

class EditWorkflowCommand {
  final WorkflowController _controller;

  EditWorkflowCommand(this._controller);

  void execute(List<String> args) {
    if (args.length < 2) {
      print('Usage: edit <id> <new_name> [task_id1 task_id2 ...]');
      return;
    }

    final workflow = Workflow(
      id: args[0],
      name: args[1],
      taskIds: args.length > 2 ? args.sublist(2) : [],
    );

    _controller.editWorkflow(workflow).then((_) {
      print('Workflow updated successfully.');
    }).catchError((error) {
      print('Error updating workflow: $error');
    });
  }
}