import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarScreen extends StatefulWidget {
  final selectedItem;

  const CalendarScreen({this.selectedItem});
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateRangePickerController _dateRangePickerController;

  @override
  void initState() {
    // TODO: implement initState

    _dateRangePickerController = DateRangePickerController();
    List<DateTime> list = [];
    for (int i = 0; i < 365; i++) {
      list.add(DateTime.now().add(Duration(days: i)));
    }
    if (widget.selectedItem == 'Always') {
      setState(() {
        _dateRangePickerController.selectedDates = list;
      });
    } else {
      _dateRangePickerController.selectedDates = <DateTime>[
        DateTime.now(),
      ];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.multiple,
            controller: _dateRangePickerController,
            showNavigationArrow: true,
          ),
        ),
      ),
    );
  }
}
