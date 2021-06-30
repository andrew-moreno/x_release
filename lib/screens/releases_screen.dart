import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/releases_screen/header.dart';
import '../widgets/releases_screen/history_button.dart';
import '../widgets/releases_screen/release_carousel.dart';

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
              Header(
                releaseCount: dummyReleases.length,
              ),
              const Spacer(),
              const ReleaseCarousel(),
              const Spacer(),
              const HistoryButton(),
            ],
          ),
        ),
      ),
    );
  }
}
