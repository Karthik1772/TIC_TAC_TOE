import 'package:flutter/material.dart';
import 'package:game/core/themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOTurn = true; // First player is O
  List<String> boardState = List.filled(9, '');
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 30),
              Text(
                isOTurn ? "Turn: O" : "Turn: X",
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPlayerScore('Player X', xScore),
                  _buildPlayerScore('Player O', oScore),
                ],
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => _tapped(index),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                        ),
                        child: Center(
                          child: Text(
                            boardState[index],
                            style: GoogleFonts.poppins(
                              color:
                                  boardState[index] == 'O'
                                      ? Colors.blue
                                      : boardState[index] == 'X'
                                      ? Colors.red
                                      : AppColors.white,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                'TIC TAC TOE',
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 50),
              Text(
                '@CREATED_BY_KASHYAP',
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerScore(String title, int score) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(color: AppColors.white, fontSize: 30),
          ),
          Text(
            score.toString(),
            style: GoogleFonts.poppins(color: AppColors.white, fontSize: 30),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    if (boardState[index] != '') return;

    setState(() {
      boardState[index] = isOTurn ? 'O' : 'X';
      filledBoxes += 1;
      isOTurn = !isOTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    final List<List<int>> winConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var condition in winConditions) {
      String a = boardState[condition[0]];
      String b = boardState[condition[1]];
      String c = boardState[condition[2]];
      if (a == b && b == c && a != '') {
        _showWinDialog(a);
        return;
      }
    }

    if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Center(
              child: Text(
                '🎉 Winner 🎉',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),
            content: Text(
              winner,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: winner == 'O' ? Colors.blue : Colors.red,
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Play Again',
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
    );

    if (winner == 'O') {
      oScore += 1;
    } else {
      xScore += 1;
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Center(
              child: Text(
                '🤝 It\'s a Draw!',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),
            content: Text(
              'No one wins this time.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 20, color: AppColors.black),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Play Again',
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  void _clearBoard() {
    setState(() {
      boardState = List.filled(9, '');
      filledBoxes = 0;
    });
  }
}
