import 'dart:convert';

import 'package:okapi/domain/workflow_entity.dart';

class WorkflowDataSerializer {
  // Could also use a third-party library like json_serializable here
  // for more automated serialization/deserialization.

  Map<String, dynamic> workflowToJson(Workflow workflow) => {
        'id': workflow.id,
        'name': workflow.name,
        'taskIds': workflow.taskIds,
      };

  Workflow workflowFromJson(Map<String, dynamic> json) => Workflow(
        id: json['id'] as String,
        name: json['name'] as String,
        taskIds: List<String>.from(json['taskIds'] as List),
      );
}
