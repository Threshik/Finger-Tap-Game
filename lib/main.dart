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

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double blueCardHeight = 0;
  double redCardHeight = 0;
  int playerAScore = 0;
  int playerBScore = 0;
  bool initialized = false;
  @override
  Widget build(BuildContext context) {
    print("Build function called");
    print(initialized);
    if (initialized == false) {
      blueCardHeight = MediaQuery.of(context).size.height / 2;
      redCardHeight = MediaQuery.of(context).size.height / 2;
      initialized = true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              print(blueCardHeight);
              setState(() {
                blueCardHeight = blueCardHeight + 10;
                redCardHeight = redCardHeight - 10;
                playerAScore += 5;
              });
              double winningCardHeight =
                  MediaQuery.of(context).size.height - 60;
              if (blueCardHeight > winningCardHeight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultPage(playerAScore, "Player A won!"),
                  ),
                );
              }
            },
            child: Container(
              color: Colors.lightBlueAccent,
              width: double.infinity,
              height: blueCardHeight,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player A",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    playerAScore.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                redCardHeight = redCardHeight + 10;
                blueCardHeight = blueCardHeight - 10;
                playerBScore += 5;
              });
              double winningCardHeight =
                  MediaQuery.of(context).size.height - 60;
              if (redCardHeight > winningCardHeight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultPage(playerBScore, "Player B won!"),
                  ),
                );
              }
            },
            child: Container(
              color: Colors.redAccent,
              width: double.infinity,
              height: redCardHeight,
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player B",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  Text(
                    playerBScore.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;
  final String player;
  ResultPage(this.score, this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "Player A won!"
          ? Colors.lightBlueAccent
          : Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            Text(player, style: TextStyle(fontSize: 30)),
            SizedBox(height: 40),
            MaterialButton(
              padding: EdgeInsets.all(10),
              color: Colors.white,

              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainApp()),
                );
              },
              child: Text(
                "Replay",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
