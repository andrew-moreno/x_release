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
              const _SettingsButton(),
            ],
          ),
          const _ArtistSubtitle()
        ],
      ),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(100),
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Icon(
          Icons.settings,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

class _ArtistSubtitle extends StatelessWidget {
  const _ArtistSubtitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        child: Text(
          _subtitleBuilder(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}

String _subtitleBuilder() {
  final text = StringBuffer();

  text.write("New releases from ");
  for (var i = 0; i < ReleaseData().releases.length - 1; i++) {
    text.write("${ReleaseData().releases[i].artist}, ");
  }
  text.write(
      "and ${ReleaseData().releases[ReleaseData().releases.length - 1].artist}");
  return text.toString();
}
