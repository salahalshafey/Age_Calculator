import 'package:my_age/widgets/date_picker.dart';
import 'package:my_age/widgets/day_when_you_born.dart';
import 'package:my_age/widgets/date_view_list.dart';

import 'package:flutter/material.dart';
import 'package:my_age/widgets/next_birth_day_live.dart';

import './models/person.dart';

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
      home: const MyHomePage(title: 'My Age'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Person _person = const Person();
  DateTime? theDate;

  void _addBirthDate(DateTime? date) {
    setState(() {
      theDate = date;
      _person = Person(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom) *
        1;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: Container(
        height: height - 10,
        width: width,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DatePiker(_addBirthDate),
              DateViewList('TOTAL AGE', _person.totalAge),
              DayWhenYouBorn(_person.dayOfBorn, _person.hijriDate),
              DateViewList(
                  'NEXT BIRTHDAY', _person.remainingTimeToNextBirthDay),
              const SizedBox(height: 8),
              NextBirthDayLive(_addBirthDate, theDate),
            ],
          ),
        ),
      ),
    );
  }
}
