import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../dummy_data.dart';
import 'release_info.dart';

class ReleaseCarousel extends StatelessWidget {
  const ReleaseCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 500,
        enableInfiniteScroll: false,
      ),
      itemCount: dummyReleases.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        child: ReleaseInfo(
          title: dummyReleases[itemIndex].title,
          artist: dummyReleases[itemIndex].artist,
          albumArt: dummyReleases[itemIndex].albumArt,
          trackCount: dummyReleases[itemIndex].trackCount,
        ),
      ),
    );
  }
}
