import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main.dart';
import 'add_status.dart';

class AppCubit extends Cubit<AddStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

//Attributes
  int numberOfUsers = 2;
  int gameScore = 51;
  List numbers = [2, 4];
  List numbersGame = [51, 71, 101, 150, 200];

  int score1 = 0;
  int score2 = 0;
  int score3 = 0;
  int score4 = 0;

  var player1 = TextEditingController();
  var player2 = TextEditingController();
  var player3 = TextEditingController();
  var player4 = TextEditingController();

/////////////////////////////////////////////////
//Methods
  void changeNumber(var value) {
    numberOfUsers = value;
    emit(UpdateData());
  }

  void changeScore(var value) {
    gameScore = value;
    emit(UpdateData());
  }

  void addScore1(int score) {
    if (score == 0) {
      score1++;
    } else if (score == 1) {
      score2++;
    } else if (score == 2) {
      score3++;
    } else {
      score4++;
    }

    emit(UpdateData());
  }

  void minusScore1(int score) {
    if (score == 0) {
      score1--;
    } else if (score == 1) {
      score2--;
    } else if (score == 2) {
      score3--;
    } else {
      score4--;
    }

    emit(UpdateData());
  }

  void addScore3(int score) {
    if (score == 0) {
      score1 += 3;
    } else if (score == 1) {
      score2 += 3;
    } else if (score == 2) {
      score3 += 3;
    } else {
      score4 += 3;
    }
    emit(UpdateData());
  }

  void minusScore3(int score) {
    if (score == 0) {
      score1 -= 3;
    } else if (score == 1) {
      score2 -= 3;
    } else if (score == 2) {
      score3 -= 3;
    } else {
      score4 -= 3;
    }
    emit(UpdateData());
  }

  void addScore5(int score) {
    if (score == 0) {
      score1 += 5;
    } else if (score == 1) {
      score2 += 5;
    } else if (score == 2) {
      score3 += 5;
    } else {
      score4 += 5;
    }
    emit(UpdateData());
  }

  void minusScore5(int score) {
    if (score == 0) {
      score1 -= 5;
    } else if (score == 1) {
      score2 -= 5;
    } else if (score == 2) {
      score3 -= 5;
    } else {
      score4 -= 5;
    }
    emit(UpdateData());
  }

  void gameEnd(BuildContext context) {
    int result = max(max(score1, score2), max(score3, score4));
    if(result > gameScore) {
      String winner;
      if (result == score1) {
        winner = player1.text;
      } else if (result == score2) {
        winner = player2.text;
      } else if (result == score3) {
        winner = player3.text;
      } else {
        winner = player4.text;
      }
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                  backgroundColor:
                  theme.onPrimaryContainer,
                  title: const Text(
                    "Congratulations!",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    "Winner is ${winner.substring(0, 1).toUpperCase() +
                        winner.substring(1)}!",
                    style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ))
                  ]));
    }else{
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        backgroundColor:theme.onPrimaryContainer,
        duration: const Duration(seconds: 3),
        content: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No One Reached The Score",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ));
    }
  }
  void gameRestart(){
    score1 = 0;
    score2 = 0;
    score3 = 0;
    score4 = 0;

    emit(UpdateData());
  }
}
