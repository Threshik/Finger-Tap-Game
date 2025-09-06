import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.lightBlueAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("Start"),
              ),
            ),
          ),
          Container(
            color: Colors.redAccent,

            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("Start"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.lightBlueAccent,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(child: Text("Player A",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),)),
                Text("10",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),)
              ],
            ),
          ),
          Container(
            color: Colors.redAccent,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Expanded(
                  child: Text("Player B",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
                ),
                
                Text("5",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
