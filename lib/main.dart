import 'package:flutter/material.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logica de negocios',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LogicaListScreen(),
    );
  }
}

class LogicaListScreen extends StatefulWidget {
  @override
  _LogicaListScreenState createState() => _LogicaListScreenState();
}

class _LogicaListScreenState extends State<LogicaListScreen> {
  List<String> _logicas = [];

  TextEditingController _logicaController = TextEditingController();

  void _addLogica() {
    setState(() {
      String newLogica = _logicaController.text;
      if (newLogica.isNotEmpty) {
        _logicas.add(newLogica);
      }
      _logicaController.clear();
    });
  }

  void _removeLogica(int index) {
    setState(() {
      _logicas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logica de negocio en dart'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _logicaController,
                    decoration: InputDecoration(
                      hintText: 'Ingrese una tarea',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addLogica,
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _logicas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_logicas[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeLogica(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
