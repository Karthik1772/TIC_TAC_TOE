import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:game/home_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  margin: const EdgeInsets.only(top: 20),
                  child: const Center(
                      child: Text(
                    "TIC TAC TOE",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
                ),
                Expanded(
                    child: AvatarGlow(
                  endRadius: 140,
                  duration: const Duration(seconds: 2),
                  glowColor: Colors.white,
                  repeat: true,
                  repeatPauseDuration: const Duration(seconds: 1),
                  startDelay: const Duration(seconds: 1),
                  child: CircleAvatar(
                    radius: 90,
                    child: Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        width: 400,
                        height: 400,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image.asset('images/Board.png'),
                        )),
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      child: const Center(
                          child: Text(
                        "PLAY GAME",
                        style: TextStyle(color: Colors.black, fontSize: 40),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ));
  }
}
