import 'package:tareas/models/tarea.dart';

class Plan {
  String nombre = '';
  final List<Tarea> tareas = [];

  int get cuentaCompletados => tareas.where((tarea) {
        return tarea.completada;
      }).length;
}
