import 'package:chuck_norris_app/models/chuck_facts.dart';
import 'package:chuck_norris_app/provider/chuck_norris_provider.dart';
import 'package:chuck_norris_app/screens/chuck_facts_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChuckNorrisProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Chuck Norris App',
        theme: ThemeData(
          primaryColor: Colors.teal,
          accentColor: Colors.yellow,
        ),
        home: ChuckFactsMainScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Here comes Chuck Norris!'),
      ),
    );
  }
}
