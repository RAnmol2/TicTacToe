import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> displayOX = ['', '', '', '', '', '', '', '', ''];
  bool IsO = true;

  var MyOwnColor = GoogleFonts.arbutus(
      textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400));

  int xPoint = 0;
  int oPoint = 0;
  int checkFull = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Center(
            child: Text(
              ' Tic Tac Toe      ',
              style: GoogleFonts.arbutus(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            // Container(
            //   color: Colors.red,
            // //  alignment: Alignment.bottomCenter,
            //   child: Text(

            // ' Tic Tac Toe ',
            // style: GoogleFonts.arbutus(fontSize: 30,fontWeight: FontWeight.w400,color: Colors.white),
            //   ),
            // ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Player  X', style: MyOwnColor),
                            Text(
                              xPoint.toString(),
                              style: MyOwnColor,
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Player  O',
                              style: MyOwnColor,
                            ),
                            Text(
                              oPoint.toString(),
                              style: MyOwnColor,
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          putOX(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Text(
                              displayOX[index],
                              //  index.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                "@AnmolSingh",
                style: MyOwnColor,
              ),
            )),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }

  void putOX(int index) {
    setState(() {
      if (IsO && displayOX[index] == '') {
        displayOX[index] = 'O';
         IsO = false;
        checkFull += 1;
      } else if (!IsO && displayOX[index] == '') {
        displayOX[index] = 'X';
         IsO = true;
        checkFull += 1;
      }
      checkBox();

      //  _CheckFull();

    });
  }

  void checkBox() {
    //row 1
    if (displayOX[0] == displayOX[1] &&
        displayOX[0] == displayOX[2] &&
        displayOX[0] != '') {
      CheckWinner(displayOX[0]);
      return;
    }

    //row 2
    if (displayOX[3] == displayOX[4] &&
        displayOX[3] == displayOX[5] &&
        displayOX[3] != '') {
      CheckWinner(displayOX[3]);
      return;
    }

    //row 3
    if (displayOX[6] == displayOX[7] &&
        displayOX[6] == displayOX[8] &&
        displayOX[6] != '') {
      CheckWinner(displayOX[6]);
      return;
    }

    //colum 1
    if (displayOX[0] == displayOX[3] &&
        displayOX[0] == displayOX[6] &&
        displayOX[0] != '') {
      CheckWinner(displayOX[0]);
      return;
    }

    //colum 2
    if (displayOX[1] == displayOX[4] &&
        displayOX[1] == displayOX[7] &&
        displayOX[1] != '') {
      CheckWinner(displayOX[1]);
      return;
    }

    //colum 3
    if (displayOX[2] == displayOX[5] &&
        displayOX[2] == displayOX[8] &&
        displayOX[2] != '') {
      CheckWinner(displayOX[2]);
      return;
    }

    //diagnol
    if (displayOX[0] == displayOX[4] &&
        displayOX[0] == displayOX[8] &&
        displayOX[0] != '') {
      CheckWinner(displayOX[0]);
      return;
    }
    if (displayOX[2] == displayOX[4] &&
        displayOX[2] == displayOX[6] &&
        displayOX[2] != '') {
      CheckWinner(displayOX[2]);
      return;
    }
    if (checkFull == 9) {
      _CheckFull();
      
    }
  }

  void CheckWinner(String winner) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            actions: [
              TextButton(
                  onPressed: () {
                    _clear();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Play Again',
                    style: GoogleFonts.adamina(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.blue),
                  )),
            ],
            title: Text(
              'winner is ' + winner,
              style: GoogleFonts.adamina(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: Colors.blue),
            ),
          );
        });
    if (winner == 'X') {
      xPoint += 1;
    } else {
      oPoint += 1;
    }
  }

  void _CheckFull() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            actions: [
              TextButton(
                  onPressed: () {
                    _clear();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Play Again',
                    style: GoogleFonts.adamina(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.red),
                  )),
            ],
            title: Center(
              child: Text(
                'It\'s a Draw',
                style: GoogleFonts.adamina(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: Colors.red),
              ),
            ),
          );
        });
  }

  void _clear() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayOX[i] = '';
      }
    });
    checkFull = 0;
  }
}
