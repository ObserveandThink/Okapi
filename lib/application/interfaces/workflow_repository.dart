import '../../domain/workflow_entity.dart';

abstract class WorkflowRepository {
  Future<List<Workflow>> getAllWorkflows();
  Future<Workflow?> getWorkflowById(String id);
  Future<void> createWorkflow(Workflow workflow);
  Future<void> updateWorkflow(Workflow workflow);
  Future<void> deleteWorkflow(String id);
}
