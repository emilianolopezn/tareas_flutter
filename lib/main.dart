import 'package:flutter/material.dart';
import 'package:tareas/plan_provider.dart';
import 'package:tareas/views/plan_screen.dart';

void main() {
  runApp(PlanesApp());
}

class PlanesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanProvider(child: PlanScreen()),
    );
  }
}
