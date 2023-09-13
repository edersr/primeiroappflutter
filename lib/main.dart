import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relógio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white30),
        useMaterial3: true,
      ),
      home: const ClockPage(title: 'Relógio'),
    );
  }
}

class ClockPage extends StatefulWidget {
  const ClockPage({super.key, required this.title});

  final String title;

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  String _time = '';

  void _updateTime() {
    setState(() {
      // Obter a hora atual
      final now = DateTime.now();
      // Formatar a hora no formato HH:mm:ss
      _time = DateFormat.Hms().format(now);
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(
            // Centraliza o título
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true, // Centraliza o título
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hora atual:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              _time,
              style: const TextStyle(fontSize: 48.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _updateTime, // Atualizar a hora quando o botão for pressionado
        tooltip: 'Atualizar',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
