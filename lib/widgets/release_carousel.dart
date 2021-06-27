import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'release_info.dart';
import '../dummy_data.dart';

class Release_Carousel extends StatelessWidget {
  const Release_Carousel({Key? key}) : super(key: key);

  final dummyReleases = DummyReleases;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 500,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
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
