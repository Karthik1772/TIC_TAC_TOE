import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:XoXo/core/common/custom_buttons.dart';
import 'package:XoXo/core/themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 70),
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    "TIC TAC TOE",
                    style: GoogleFonts.varelaRound(
                      color: AppColors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AvatarGlow(
                  glowRadiusFactor: 2.0,
                  duration: const Duration(seconds: 2),
                  glowColor: AppColors.white,
                  repeat: true,
                  startDelay: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundColor: AppColors.transperent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.asset('assets/logo1.png'),
                    ),
                  ),
                ),
              ),
              CustomButtons(
                text: "PLAY GAME",
                onpressed: () => Navigator.pushNamed(context, '/home'),
                textSize: 40,
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
