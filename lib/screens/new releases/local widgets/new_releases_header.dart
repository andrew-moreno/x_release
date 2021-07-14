import 'package:flutter/material.dart';
import 'package:x_release/constraints.dart';

import '../../../models/release_data.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                ReleaseData().releases.length.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kAccentRed),
              ),
              Text(
                " Releases",
                style: Theme.of(context).textTheme.headline4,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 200,
              child: Text(
                "New songs from Rex Orange County, Sam Evian, and Jaden",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
