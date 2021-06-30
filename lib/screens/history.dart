import 'package:flutter/material.dart';
import 'package:x_release/widgets/history/release_info.dart';

import '../constraints.dart';
import '../dummy_data.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  static const routeName = "/history";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF2E2E3E),
              width: double.infinity,
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "History",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kAccentRed),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: dummyReleases.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: HistoryReleaseTile(
                        title: dummyReleases[index].title,
                        artist: dummyReleases[index].artist,
                        albumArt: dummyReleases[index].albumArt,
                        releaseDate: "June 10",
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
