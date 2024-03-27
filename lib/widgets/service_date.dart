import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:wagon/models/service.dart';

class ServiceDate extends StatefulWidget {
  const ServiceDate({
    super.key,
    required this.service,
    required this.onChanged,
  });

  final Service? service;
  final Function(DateTime)? onChanged;

  @override
  State<ServiceDate> createState() => _ServiceDateState();
}

class _ServiceDateState extends State<ServiceDate> {
  DateTime? newHour;

  @override
  void initState() {
    newHour = widget.service?.hour;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: widget.service?.hour ?? DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
          ).then((selectedDate) {
            if (selectedDate != null) {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(
                    widget.service?.hour ?? DateTime.now()),
              ).then((selectedTime) {
                if (selectedTime != null) {
                  final newDateTime = DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  );

                  newHour = newDateTime;
                  widget.onChanged?.call(newDateTime);
                  setState(() {});
                }
              });
            }
          });
        },
        child: Text(
          newHour?.toMoment().calendar() ?? 'Select date',
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
