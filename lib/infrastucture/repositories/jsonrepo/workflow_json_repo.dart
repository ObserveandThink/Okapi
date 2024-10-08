import 'dart:io';
import 'dart:convert';
import 'package:okapi/application/interfaces/workflow_repository.dart';
import 'package:okapi/domain/workflow_entity.dart';

class WorkflowJsonRepo implements WorkflowRepository {
  final String file_location;

  WorkflowJsonRepo({required this.file_location});

  Future<void> initFile() async {
    final file = File(file_location);
    final directoryPath = Directory(file_location).parent;

    // Check if the file exists
    if (!await file.exists()) {
      print('File does not exist. Creating new file...');

      // Create the directory if it doesn't exist
      directoryPath.createSync(recursive: true);

      // Create the file
      await file.create();
      print('New file created successfully.');
    } else {
      print('File already exists.');
    }
  }

  Future<List<Workflow>> getAllWorkflows() {
    throw UnimplementedError();
  }

  Future<void> createWorkflow(Workflow workflow) {
    throw UnimplementedError();
  }

  Future<void> updateWorkflow(Workflow workflow) {
    throw UnimplementedError();
  }

  Future<void> deleteWorkflow(String id) {
    throw UnimplementedError();
  }
}
