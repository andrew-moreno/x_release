import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:x_release/dummy_data.dart';
import 'package:x_release/models/music.dart';
import 'package:x_release/widgets/release_text.dart';
import '../constraints.dart';

class ReleaseDetails extends StatelessWidget {
  const ReleaseDetails({
    Key? key,
  }) : super(key: key);

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
                    ReleaseText(
                        title: routeArgs.title,
                        artist: routeArgs.artist,
                        trackCount: routeArgs.tracks.length),
                    ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: routeArgs.tracks.length,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kCornerRadius),
                              color: kLightBackgroundColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 180,
                                child: Text(
                                  routeArgs.tracks[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "DMSans",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.play_arrow_rounded,
                                color: kAccentGreen,
                                size: 30,
                              )
                            ],
                          ),
                        );
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
