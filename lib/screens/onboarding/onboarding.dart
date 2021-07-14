import 'package:flutter/material.dart';

import '../../constraints.dart';
import '../../widgets/button.dart';
import '../new releases/new_releases_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  static const routeName = "/onboarding";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              const Text(
                "X",
                style: TextStyle(
                  color: kAccentRed,
                  fontSize: 80,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  height: 0.8,
                ),
              ),
              const Text(
                "Releases",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: const Button(
                  route: Releases.routeName,
                  text: "Login to Spotify",
                  width: 300,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
