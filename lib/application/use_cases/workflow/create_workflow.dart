import '../../../domain/workflow_entity.dart';
import '../../interfaces/workflow_repository.dart';

class CreateWorkflow {
	final WorkflowRepository workflowrepository;

	CreateWorkflow({
		required this.workflowrepository
	});

	Future<void> execute(Workflow workflow) async {
		await workflowrepository.createWorkflow(workflow);
	}


}
