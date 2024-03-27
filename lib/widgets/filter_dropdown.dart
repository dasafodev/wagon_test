import 'package:flutter/material.dart';

class FilterDropdown extends StatelessWidget {
  const FilterDropdown({
    super.key,
    required this.dropdownValue,
    this.onChanged,
  });

  final String dropdownValue;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DropdownButton<String>(
          value: dropdownValue,
          underline: SizedBox.shrink(),
          icon: const SizedBox.shrink(),
          alignment: Alignment.center,
          onChanged: onChanged,
          items: <String>['All', 'Driver', 'Route']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              alignment: Alignment.center,
              child: Text(
                value,
                textAlign: TextAlign.center,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
