import 'package:flutter/material.dart';

import 'package:desmos_rewards_verifier/screens/export.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desmos mainnet balance verifier',
      theme: ThemeData(
        fontFamily: 'RaleWay',
        textTheme: Theme.of(context).textTheme.copyWith(
              headline1: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 65,
                    color: Color(0xFFed6c53),
                  ),
              headline2: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF3B3C24),
                    fontSize: 20,
                  ),
              bodyText1: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Color(0xFF3B3C24),
              ),
          bodyText2: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 24,
            color: Color(0xFF3B3C24),
          )
            ),
        primarySwatch: MaterialColor(
          0xFFed6c53,
          <int, Color>{
            50: Color(0xFFfdedea),
            100: Color(0xFFfad3cb),
            200: Color(0xFFf6b6a9),
            300: Color(0xFFf29887),
            400: Color(0xFFf0826d),
            500: Color(0xFFed6c53),
            600: Color(0xFFeb644c),
            700: Color(0xFFe85942),
            800: Color(0xFFe54f39),
            900: Color(0xFFe03d29),
          },
        ),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: VerifyWalletScreen(),
    );
  }
}
