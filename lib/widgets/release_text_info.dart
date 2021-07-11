import 'package:flutter/material.dart';

import '../constraints.dart';

class ReleaseTextInfo extends StatelessWidget {
  const ReleaseTextInfo({
    Key? key,
    required this.title,
    required this.artist,
    required this.trackCount,
  }) : super(key: key);

  final String title;
  final String artist;
  final int trackCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontSize: 27, height: 1.3),
        ),
        Text(
          artist,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontSize: 18, height: 1.3),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Row(
            children: [
              _buildInfoContainer(
                  (trackCount == 1) ? "Single" : "Album", kAccentBlue),
              (trackCount > 1)
                  ? _buildInfoContainer(trackCount.toString(), kAccentPurple)
                  : const Spacer() // using as an empty widget for conditional statement
            ],
          ),
        )
      ],
    );
  }
}

Container _buildInfoContainer(String text, Color color) {
  return Container(
    margin: const EdgeInsets.only(right: 15),
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: color,
    ),
    child: Text(
      text,
      style:
          const TextStyle(fontFamily: "DM_Sans", fontWeight: FontWeight.w700),
    ),
  );
}
