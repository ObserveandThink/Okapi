import '../../../application/controllers/workflow_controller.dart';

class DeleteWorkflowCommand {
  final WorkflowController _controller;

  DeleteWorkflowCommand(this._controller);

  void execute(List<String> args) {
    if (args.isEmpty) {
      print('Usage: delete <id>');
      return;
    }

    _controller.deleteWorkflow(args[0]).then((_) {
      print('Workflow deleted successfully.');
    }).catchError((error) {
      print('Error deleting workflow: $error');
    });
  }
}