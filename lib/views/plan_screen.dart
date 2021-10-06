import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlanScreenState();
  }
}

class _PlanScreenState extends State<PlanScreen> {
  final plan = Plan();

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plan"),
      ),
      body: _construirLista(),
      floatingActionButton: _construirBotonAgregarTarea(),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget _construirBotonAgregarTarea() {
    return FloatingActionButton(
      child: Icon(Icons.add_task),
      onPressed: () {
        setState(() {
          plan.tareas.add(Tarea());
        });
      },
    );
  }

  var indices = [1, 2, 3, 4];
  Widget _construirLista() {
    /*return ListView(
      children: [
        for (int indice in indices)
          ListTile(
            title: Text(
              "Hola",
            ),
          )
      ],
    );*/
    return ListView.builder(
      //controller: scrollController,
      itemCount: plan.tareas.length,
      itemBuilder: (context, index) => _construirCeldaTarea(plan.tareas[index]),
    );
  }

  Widget _construirCeldaTarea(Tarea tarea) {
    return ListTile(
      leading: Checkbox(
        value: tarea.completada,
        onChanged: (selected) {
          setState(() {
            tarea.completada = selected!;
          });
        },
      ),
      title: TextField(
        onChanged: (text) {
          setState(() {
            tarea.descripcion = text;
          });
        },
      ),
    );
  }
}
