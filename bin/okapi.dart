import 'package:okapi/presentation/cli/cli_controller.dart';
import 'package:okapi/application/controllers/workflow_controller.dart';
import 'package:okapi/infrastucture/repositories/jsonrepo/workflow_json_repo.dart';

void main(List<String> arguments) {
  final workflowRepo = WorkflowJsonRepo(fileLocation: "workflow.json");
  final workflowController =
      WorkflowController(workflowRepository: workflowRepo);
  final cliController = CliController(workflowController);

  cliController.executeCommand(arguments);
}
