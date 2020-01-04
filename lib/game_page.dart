import 'package:flutter/material.dart';
import 'package:flutter_2048/domain/make_move.dart';
import 'package:flutter_2048/domain/random_tile_provider.dart';
import 'package:flutter_2048/ui/board/bloc/board_bloc.dart';
import 'mycolor.dart';
import 'ui/board/board_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/score/bloc/score_bloc.dart';
import 'ui/score/bloc/score_state.dart';

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
              BoardWidget(BoardBloc(BlocProvider.of(context), MakeMove(),
                  RandomTileProvider(), BlocProvider.of(context))),
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreBloc, ScoreState>(
      bloc: BlocProvider.of(context),
      builder: (context, state) {
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
                    state.score.toString(),
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
      },
    );
  }
}

class NewGameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
            FutureBuilder<String>(
              future: Future.value("0"),
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  );
                } else {
                  return Text(
                    '0',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
