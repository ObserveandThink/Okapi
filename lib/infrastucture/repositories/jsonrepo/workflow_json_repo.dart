import 'dart:io';
import 'dart:convert';
import 'package:okapi/application/interfaces/workflow_repository.dart';
import 'package:okapi/domain/workflow_entity.dart';

class WorkflowJsonRepo implements WorkflowRepository {
  final String file_location;

  WorkflowJsonRepo({required this.file_location});

  Future<void> initFile() async {
    // ... (keep the existing implementation)
  }

  Future<List<Workflow>> getAllWorkflows() async {
    final file = File(file_location);
    final contents = await file.readAsString();
    final List<dynamic> jsonList = json.decode(contents);
    return jsonList.map((json) => _workflowFromJson(json)).toList();
  }

  Future<void> createWorkflow(Workflow workflow) async {
    final file = File(file_location);
    List<dynamic> workflows = [];
    if (await file.exists()) {
      final contents = await file.readAsString();
      workflows = json.decode(contents);
    }
    workflows.add(_workflowToJson(workflow));
    await file.writeAsString(json.encode(workflows));
  }

  Future<void> updateWorkflow(Workflow workflow) async {
    final file = File(file_location);
    final contents = await file.readAsString();
    List<dynamic> workflows = json.decode(contents);
    final index = workflows.indexWhere((w) => w['id'] == workflow.id);
    if (index != -1) {
      workflows[index] = _workflowToJson(workflow);
      await file.writeAsString(json.encode(workflows));
    }
  }

  Future<void> deleteWorkflow(String id) async {
    final file = File(file_location);
    final contents = await file.readAsString();
    List<dynamic> workflows = json.decode(contents);
    workflows.removeWhere((w) => w['id'] == id);
    await file.writeAsString(json.encode(workflows));
  }

  Map<String, dynamic> _workflowToJson(Workflow workflow) {
    return {
      'id': workflow.id,
      'name': workflow.name,
      'taskIds': workflow.taskIds,
    };
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

  Workflow _workflowFromJson(Map<String, dynamic> json) {
    return Workflow(
      id: json['id'],
      name: json['name'],
      taskIds: List<String>.from(json['taskIds']),
    );
  }
}
