import 'package:intl/intl.dart';
import 'package:time/time.dart';

import 'package:flutter/material.dart';

class DatePiker extends StatefulWidget {
  const DatePiker(this.addBirthDate, {Key? key}) : super(key: key);

  final Function addBirthDate;

  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DatePiker> {
  DateTime? date;
  int _counter = 0;

  void _showDateTimePicker(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime(2002, 10, 29),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      setState(() {
        if (pickedDate == null) return;
        date = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const Text(
          'DATE OF BIRTH',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: GestureDetector(
            onTap: () => _showDateTimePicker(context),
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    date == null
                        ? 'No Date Chosen'
                        : DateFormat('dd - MM - yyy').format(date!),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                IconButton(
                  onPressed: () => _showDateTimePicker(context),
                  icon: Icon(
                    Icons.date_range_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  tooltip: 'Pick a Date',
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            if (date == null || _counter > 0) {
              return;
            }

            _counter++;
            while (true) {
              await 1.seconds.delay;
              widget.addBirthDate(date);
            }
          },
          child: const Text('CALCULATE'),
        )
      ],
    );
  }
}