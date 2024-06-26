import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; //the first player is 0
  List<String> displayEx0h = ['', '', '', '', '', '', '', '', ''];
  int ohscore = 0;
  int exscore = 0;
  int filledboxes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.black,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Player X',
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          Text(
                            exscore.toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 40),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Player 0',
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          Text(
                            ohscore.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Center(
                          child: Text(
                        displayEx0h[index],
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                    ),
                  );
                },
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.black,
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      'TIC TAC TOE',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      '@CREATED_BY_KASHYAP',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayEx0h[index] == '') {
        displayEx0h[index] = 'O';
        filledboxes += 1;
      } else if (!ohTurn && displayEx0h[index] == '') {
        displayEx0h[index] = 'X';
        filledboxes += 1;
      }
      ohTurn = !ohTurn;
      _checkwinner();
    });
  }

  void _checkwinner() {
    //checks 1st row
    if (displayEx0h[0] == displayEx0h[1] &&
        displayEx0h[0] == displayEx0h[2] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0]);
    }
    //checks 2nd row
    if (displayEx0h[3] == displayEx0h[4] &&
        displayEx0h[3] == displayEx0h[5] &&
        displayEx0h[3] != '') {
      _showWinDialog(displayEx0h[3]);
    }
    //checks 3rd row
    if (displayEx0h[6] == displayEx0h[7] &&
        displayEx0h[6] == displayEx0h[8] &&
        displayEx0h[6] != '') {
      _showWinDialog(displayEx0h[6]);
    }
    //checks 1st column
    if (displayEx0h[0] == displayEx0h[3] &&
        displayEx0h[0] == displayEx0h[6] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0]);
    }
    //checks 2nd column
    if (displayEx0h[1] == displayEx0h[4] &&
        displayEx0h[1] == displayEx0h[7] &&
        displayEx0h[1] != '') {
      _showWinDialog(displayEx0h[1]);
    }
    //checks 3rd column
    if (displayEx0h[2] == displayEx0h[5] &&
        displayEx0h[2] == displayEx0h[8] &&
        displayEx0h[2] != '') {
      _showWinDialog(displayEx0h[2]);
    }
    //checks left to right diagonal
    if (displayEx0h[0] == displayEx0h[4] &&
        displayEx0h[0] == displayEx0h[8] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0]);
    }
    //checks right to left diagonal
    if (displayEx0h[6] == displayEx0h[4] &&
        displayEx0h[6] == displayEx0h[2] &&
        displayEx0h[6] != '') {
      _showWinDialog(displayEx0h[6]);
    } else if (filledboxes == 9) {
      _showdrawDialog();
    }
  }

  void _showdrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Draw'),
            actions: [
              Container(
                width: 60,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    _clearboard();
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.5),
                    child: Text('Play Again'),
                  ),
                ),
              )
            ],
          );
        });
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS :' + winner),
            actions: [
              Container(
                width: 60,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    _clearboard();
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.5),
                    child: Text('Play Again'),
                  ),
                ),
              )
            ],
          );
        });
    if (winner == 'O') {
      ohscore += 1;
    } else if (winner == 'X') {
      exscore += 1;
    }
  }

  void _clearboard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayEx0h[i] = '';
      }
    });
    filledboxes = 0;
  }
}
