import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/release_carousel.dart';
import '../dummy_data.dart';
import '../widgets/history_button.dart';

class Releases_Screen extends StatelessWidget {
  final dummyReleases = DummyReleases;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 30,
          ),
          child: Column(
            children: [
              Header(
                releaseCount: dummyReleases.length,
              ),
              Spacer(),
              Release_Carousel(),
              Spacer(),
              HistoryButton(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
