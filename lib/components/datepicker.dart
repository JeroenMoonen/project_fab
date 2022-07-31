import 'package:flutter/cupertino.dart';
import 'package:project_fab/components/input.dart';

Widget makeDatepicker({label, date, controller, onDateTimeChanged, context}) {
  //TODO convert this to TextField(keyboardType: TextInputType.datetime)
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(
          top: 6.0,
        ),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  return makeInput(
    label: 'Date of birth',
    controller: controller,
    onTap: () => _showDialog(
      CupertinoDatePicker(
        initialDateTime: date,
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        maximumDate: DateTime.now(),
        onDateTimeChanged: onDateTimeChanged,
      ),
    ),
  );
}
