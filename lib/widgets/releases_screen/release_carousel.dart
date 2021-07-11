import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:x_release/constraints.dart';

import '../../dummy_data.dart';
import 'release.dart';

class ReleaseCarousel extends StatelessWidget {
  ReleaseCarousel({Key? key}) : super(key: key);

  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SmoothPageIndicator(
            controller: controller,
            count: dummyReleases.length,
            effect: const WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: kAccentRed,
              dotColor: kLightBackgroundColor,
            ),
          ),
        ),
        Container(
          height: 500,
          child: PageView(
            controller: controller,
            children: List.generate(
              dummyReleases.length,
              (index) => Release(
                id: dummyReleases[index].id,
                title: dummyReleases[index].title,
                artist: dummyReleases[index].artist,
                albumArt: dummyReleases[index].albumArt,
                tracks: dummyReleases[index].tracks,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
