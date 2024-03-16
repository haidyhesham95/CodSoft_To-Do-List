import 'package:flutter/material.dart';
import '../view/add_to_do.dart';


FloatingActionButton addFloatingButton(BuildContext context) {
  return FloatingActionButton(
    shape: const CircleBorder(),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AddTodo()));
    },
    backgroundColor: Colors.purple.shade200,
    child: const Icon(
      Icons.add,
      size: 28,
      color: Colors.white,
    ),
  );
}