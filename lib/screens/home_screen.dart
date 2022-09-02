import 'package:flutter/material.dart';

import '../models/person.dart';

import '../widgets/date_picker.dart';
import '../widgets/date_view_list.dart';
import '../widgets/day_when_you_born.dart';
import '../widgets/next_birth_day_live.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
