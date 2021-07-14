import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import '../../../constraints.dart';
import '../../../models/release_data.dart';
import 'new_releases_card.dart';

class ReleaseCarousel extends StatelessWidget {
  ReleaseCarousel({Key? key}) : super(key: key);

  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmoothPageIndicator(
          controller: controller,
          count: ReleaseData().releases.length,
          effect: const WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: kAccentRed,
            dotColor: kLightBackgroundColor,
          ),
        ),
        SizedBox(
          height: 500,
          child: PageView(
            controller: controller,
            children: List.generate(
              ReleaseData().releases.length,
              (index) => ReleaseCard(
                id: ReleaseData().releases[index].id,
                title: ReleaseData().releases[index].title,
                artist: ReleaseData().releases[index].artist,
                albumArt: ReleaseData().releases[index].albumArt,
                tracks: ReleaseData().releases[index].tracks,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
