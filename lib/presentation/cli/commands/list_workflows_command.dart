import '../../../application/controllers/workflow_controller.dart';

class ListWorkflowsCommand {
  final WorkflowController _controller;

  ListWorkflowsCommand(this._controller);

  void execute(List<String> args) {
    _controller.getAllWorkflows().then((workflows) {
      if (workflows.isEmpty) {
        print('No workflows found.');
      } else {
        print('Workflows:');
        for (var workflow in workflows) {
          print('- ${workflow.name} (ID: ${workflow.id})');
        }
      }
    }).catchError((error) {
      print('Error listing workflows: $error');
    });
  }
}