import 'package:flutter/material.dart';

import '../widgets/new_releases/new_releases_carousel.dart';
import '../widgets/new_releases/new_releases_header.dart';
import '../widgets/new_releases/new_releases_history_button.dart';

class Releases extends StatelessWidget {
  static const routeName = "/";

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
              const HistoryButton(),
            ],
          ),
        ),
      ),
    );
  }
}
