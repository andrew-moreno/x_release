import 'dart:ui';
import 'package:flutter/material.dart';

import '../constraints.dart';
import '../models/music.dart';
import '../widgets/release_text_info.dart';
import '../widgets/release_details/release_details_track_list.dart';

class ReleaseDetails extends StatelessWidget {
  const ReleaseDetails({Key? key}) : super(key: key);

  static const routeName = "/release-details";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments! as Music;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(routeArgs.albumArt),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kCornerRadius),
                    color: kDarkBackgroundColor),
                height: 500,
                width: 300,
                child: ListView(
                  children: [
                    ReleaseTextInfo(
                        title: routeArgs.title,
                        artist: routeArgs.artist,
                        trackCount: routeArgs.tracks.length),
                    ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: routeArgs.tracks.length,
                      itemBuilder: (_, index) {
                        return TrackList(routeArgs: routeArgs, index: index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
