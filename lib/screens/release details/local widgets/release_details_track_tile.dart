import 'package:flutter/material.dart';

import '../../../constraints.dart';
import '../../../models/music.dart';

class TrackTile extends StatelessWidget {
  const TrackTile({
    Key? key,
    required this.routeArgs,
    required this.index,
  }) : super(key: key);

  final Music routeArgs;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kCornerRadius),
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
  }
}
