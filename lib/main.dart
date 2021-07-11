import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constraints.dart';
import 'dummy_data.dart';
import 'screens/history.dart';
import 'screens/release_details.dart';
import 'screens/releases_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.73, 759.27),
      builder: () => MaterialApp(
        theme: ThemeData(
          backgroundColor: kDarkBackgroundColor,
          canvasColor: kDarkBackgroundColor,
          textTheme: const TextTheme(
            headline4: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            headline5: TextStyle(
              // artist
              fontFamily: "DM_Sans",
              color: kSubtitle,
            ),
            bodyText1: TextStyle(
              // header subtext
              fontFamily: "Poppins",
              fontWeight: FontWeight.w300,
              fontSize: 14,
              color: kSubtitle,
            ),
          ),
        ),
        routes: {
          Releases.routeName: (ctx) => Releases(),
          History.routeName: (ctx) => History(),
          ReleaseDetails.routeName: (ctx) => ReleaseDetails()
        },
      ),
    );
  }
}
