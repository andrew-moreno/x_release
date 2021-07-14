import 'package:flutter/material.dart';

import '../../models/release_data.dart';
import 'local widgets/history_header.dart';
import 'local widgets/history_tile.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  static const routeName = "/history";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HistoryHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: ReleaseData().releases.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: HistoryTile(
                      title: ReleaseData().releases[index].title,
                      artist: ReleaseData().releases[index].artist,
                      albumArt: ReleaseData().releases[index].albumArt,
                      releaseDate: ReleaseData().releases[index].releaseDate,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
