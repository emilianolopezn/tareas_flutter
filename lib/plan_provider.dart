import 'package:flutter/material.dart';
import 'models/data_layer.dart';

class PlanProvider extends InheritedWidget {
  final _plan = Plan();

  PlanProvider({
    required Widget child,
  }) : super(
          child: child,
        );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static Plan of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!._plan;
  }
}
