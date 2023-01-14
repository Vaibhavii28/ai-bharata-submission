import 'package:ai_bharata_submission/Screens/coins_screen.dart';
import 'package:ai_bharata_submission/Screens/home_screen.dart';
import 'package:ai_bharata_submission/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: kPrimaryTextColor,
          fontFamily: 'Onest',
        ),
        iconTheme: const IconThemeData(color: kPrimaryColor),

      ),
      initialRoute: HomeScreen.id,
      routes: {
        CoinsScreen.id:(context)=> CoinsScreen(),
        HomeScreen.id:(context)=> HomeScreen(),
      },
    );
  }
}

