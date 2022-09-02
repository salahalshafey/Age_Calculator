import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Age',
      theme: ThemeData(
        // primarySwatch: Colors.green,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                // fontFamily: 'OpenSans',
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
              headline2: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),

        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.grey.shade200),
      ),
      home: const HomeScreen(title: 'My Age'),
    );
  }
}
