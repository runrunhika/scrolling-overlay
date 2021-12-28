import 'package:flutter/material.dart';

import 'Widget/TextFieldWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Overlay"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: [
          Container(
            height: 120,
            color: Colors.blue,
          ),
          Container(
            height: 120,
            color: Colors.red,
          ),
          Container(
            height: 120,
            color: Colors.orangeAccent,
          ),
          const SizedBox(
            height: 12,
          ),
          TextFieldWidget(),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 120,
            color: Colors.lightBlueAccent,
          ),
          Container(
            height: 120,
            color: Colors.green,
          ),
          Container(
            height: 120,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  
}
