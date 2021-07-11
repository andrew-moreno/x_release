import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../dummy_data.dart';
import 'release.dart';

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
          Release(
        id: dummyReleases[itemIndex].id,
        title: dummyReleases[itemIndex].title,
        artist: dummyReleases[itemIndex].artist,
        albumArt: dummyReleases[itemIndex].albumArt,
        tracks: dummyReleases[itemIndex].tracks,
      ),
    );
  }
}
