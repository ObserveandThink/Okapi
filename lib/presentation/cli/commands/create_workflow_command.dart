import '../../../application/controllers/workflow_controller.dart';
import '../../../domain/workflow_entity.dart';

class CreateWorkflowCommand {
  final WorkflowController _controller;

  CreateWorkflowCommand(this._controller);

  void execute(List<String> args) {
    if (args.length < 2) {
      print('Usage: create <id> <name> [task_id1 task_id2 ...]');
      return;
    }

    final workflow = Workflow(
      id: args[0],
      name: args[1],
      taskIds: args.length > 2 ? args.sublist(2) : [],
    );

    _controller.createWorkflow(workflow).then((_) {
      print('Workflow created successfully.');
    }).catchError((error) {
      print('Error creating workflow: $error');
    });
  }
}