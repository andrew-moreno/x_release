import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../history/history_screen.dart';
import 'local widgets/new_releases_carousel.dart';
import 'local widgets/new_releases_header.dart';

class Releases extends StatelessWidget {
  static const routeName = "/releases";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          child: Column(
            children: [
              const Header(),
              const Spacer(),
              ReleaseCarousel(),
              const Spacer(),
              Button(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    History.routeName,
                  );
                },
                text: "History",
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
