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

class SecondApp extends StatefulWidget {
  String label1="";
  String label2="";
  //constructor
  SecondApp(this.label1,this.label2);

  @override
  State<SecondApp> createState() => _SecondAppState();
}

class _SecondAppState extends State<SecondApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text("Second page")),
      body: Center(
        child: Column(
        children: [
          Text(widget.label1),
          Text(widget.label2),

          MaterialButton(
            color: Colors.amber,
            child: Text("Go Back (POP)"),
            onPressed: (){
              Navigator.pop(context);
          }
          
          )
        ],
      ),
      )
    );
  }
}
