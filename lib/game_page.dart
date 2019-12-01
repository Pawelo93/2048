import 'package:flutter/material.dart';
import 'mycolor.dart';

class GamePage extends StatefulWidget {
  GamePage({Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '2048',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(MyColor.gridBackground),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Score(),
              BoardWidget(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NewGameWidget(),
                    HighScoreWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Score extends StatelessWidget {
  var score = 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(MyColor.gridBackground),
        ),
        height: 82.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 2.0),
              child: Text(
                'Score',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                '${score}',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BoardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width - 80) / 4;
    double gridHeight = gridWidth;
    double height = 30 + (gridHeight * 4) + 10;
    bool isGameOver = false;
    bool isGameWon = false;

    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                crossAxisCount: 4,
//                children: getGrid(gridWidth, gridHeight),
              ),
              onVerticalDragEnd: (DragEndDetails details) {
                //primaryVelocity -ve up +ve down
                if (details.primaryVelocity < 0) {
//                  handleGesture(0);
                } else if (details.primaryVelocity > 0) {
//                  handleGesture(1);
                }
              },
              onHorizontalDragEnd: (details) {
                //-ve right, +ve left
                if (details.primaryVelocity > 0) {
//                  handleGesture(2);
                } else if (details.primaryVelocity < 0) {
//                  handleGesture(3);
                }
              },
            ),
          ),
          isGameOver
              ? Container(
            height: height,
            color: Color(MyColor.transparentWhite),
            child: Center(
              child: Text(
                'Game over!',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color(MyColor.gridBackground)),
              ),
            ),
          )
              : SizedBox(),
          isGameWon
              ? Container(
            height: height,
            color: Color(MyColor.transparentWhite),
            child: Center(
              child: Text(
                'You Won!',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color(MyColor.gridBackground)),
              ),
            ),
          )
              : SizedBox(),
        ],
      ),
      color: Color(MyColor.gridBackground),
    );
  }
}

class NewGameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return           Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(MyColor.gridBackground),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: IconButton(
          iconSize: 35.0,
          icon: Icon(
            Icons.refresh,
            color: Colors.white70,
          ),
          onPressed: () {
//                  setState(() {
//                    grid = blankGrid();
//                    gridNew = blankGrid();
//                    grid = addNumber(grid, gridNew);
//                    grid = addNumber(grid, gridNew);
//                    score = 0;
//                    isgameOver=false;
//                    isgameWon=false;
//                  });
          },
        ),
      ),
    );
  }
}

class HighScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(MyColor.gridBackground),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'High Score',
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold),
            ),
            FutureBuilder<String>(
              future: Future.value("10"),
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  );
                } else {
                  return Text(
                    '0',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}


