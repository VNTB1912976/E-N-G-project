// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<int> convert0(String? stringRX) async {
  // Check if stringRX is null or empty before proceeding
  if (stringRX == null || stringRX.isEmpty) {
    // Return a default value, or handle the case appropriately
    return 0; // Assuming 0 as a default value for this example
  }
  // Now we're sure stringRX is not null and not empty, so we can safely split
  List<String> numbersList = stringRX.split(',');
  // Converting the list of strings to a list of integers
  // Since we're now sure numbersList is not null, we can proceed without null checks here
  List<int> integersList =
      numbersList.map((s) => int.tryParse(s) ?? 0).toList();
  // Return the first element or a default value if the list is empty
  return integersList.isNotEmpty ? integersList[1] : 0;
}
