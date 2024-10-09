import 'dart:io';

import '../../application/controllers/workflow_controller.dart';
import 'commands/create_workflow_command.dart';
import 'commands/edit_workflow_command.dart';
import 'commands/delete_workflow_command.dart';
import 'commands/list_workflows_command.dart';

class CliController {
  final WorkflowController _workflowController;

  CliController(this._workflowController);

  void executeCommand(List<String> args) {
    if (args.length == 0) {
      print('Unknown command. Available commands: create, edit, delete, list');
      exit(0);
    }
    switch (args[0]) {
      case 'create':
        CreateWorkflowCommand(_workflowController).execute(args.sublist(1));
        break;
      case 'edit':
        EditWorkflowCommand(_workflowController).execute(args.sublist(1));
        break;
      case 'delete':
        DeleteWorkflowCommand(_workflowController).execute(args.sublist(1));
        break;
      case 'list':
        ListWorkflowsCommand(_workflowController).execute(args.sublist(1));
        break;
      default:
        print(
            'Unknown command. Available commands: create, edit, delete, list');
    }
  }
}
