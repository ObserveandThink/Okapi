import 'dart:io';
import 'dart:convert';
import 'package:okapi/application/interfaces/workflow_repository.dart';
import 'package:okapi/domain/workflow_entity.dart';

class WorkflowJsonRepo implements WorkflowRepository {
  final String fileLocation;
  late final File _file;

  WorkflowJsonRepo({required this.fileLocation}) {
    _file = File(fileLocation);
  }

  Future<List<Map<String, dynamic>>> _readWorkflows() async {
    if (!await _file.exists()) {
      return [];
    }
    final contents = await _file.readAsString();
    return List<Map<String, dynamic>>.from(json.decode(contents));
  }

  Future<void> _writeWorkflows(List<Map<String, dynamic>> workflows) async {
    await _file.writeAsString(json.encode(workflows));
  }

  @override
  Future<List<Workflow>> getAllWorkflows() async {
    final jsonList = await _readWorkflows();
    return jsonList.map(_workflowFromJson).toList();
  }

  @override
  Future<void> createWorkflow(Workflow workflow) async {
    final workflows = await _readWorkflows();
    workflows.add(_workflowToJson(workflow));
    await _writeWorkflows(workflows);
  }

  @override
  Future<void> updateWorkflow(Workflow workflow) async {
    final workflows = await _readWorkflows();
    final index = workflows.indexWhere((w) => w['id'] == workflow.id);
    if (index != -1) {
      workflows[index] = _workflowToJson(workflow);
      await _writeWorkflows(workflows);
    }
  }

  @override
  Future<void> deleteWorkflow(String id) async {
    final workflows = await _readWorkflows();
    workflows.removeWhere((w) => w['id'] == id);
    await _writeWorkflows(workflows);
  }

  @override
  Future<Workflow?> getWorkflowById(String id) async {
    final workflows = await getAllWorkflows();
    try {
      return workflows.firstWhere((w) => w.id == id);
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic> _workflowToJson(Workflow workflow) => {
        'id': workflow.id,
        'name': workflow.name,
        'taskIds': workflow.taskIds,
      };

  Workflow _workflowFromJson(Map<String, dynamic> json) => Workflow(
        id: json['id'],
        name: json['name'],
        taskIds: List<String>.from(json['taskIds']),
      );
}
