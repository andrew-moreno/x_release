import 'package:flutter/material.dart';
import 'package:x_release/constraints.dart';

class Header extends StatelessWidget {
  const Header({Key? key, this.releaseCount}) : super(key: key);
  final releaseCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                releaseCount.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kAccentRed),
              ),
              Text(
                " Releases",
                style: Theme.of(context).textTheme.headline4,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
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
