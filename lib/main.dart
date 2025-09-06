import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Main Page")),
        body: Center(
          child: MaterialButton(
            height: 50,
            color: Colors.amber,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondApp("Hello World","Holla")),
              );
            },
            child: Text("Click me"),
          ),
        ),
      ),
    );
  }
}

class SecondApp extends StatelessWidget {
  String label1="";
  String label2="";
  //constructor
  SecondApp(this.label1,this.label2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text("Second page")),
      body: Column(
        children: [
          Text(label1),
          Text(label2)
        ],
      )
    );
  }
}
