import 'package:calendar/screens/calendar_screen.dart';
import 'package:flutter/material.dart';

const List<String> itemList = ['Always', 'Rare'];

class DropdownScreen extends StatefulWidget {
  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  String selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose one',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan),
              ),
              buildDropdownButton(),
              SizedBox(
                height: 40.0,
              ),
              FlatButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return selectedItem != null
                          ? CalendarScreen(
                              selectedItem: selectedItem,
                            )
                          : AlertDialog(
                              title: Text('select one'),
                            );
                    },
                  ));
                },
                child: Text(
                  'Go To Next Screen',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  DropdownButton<String> buildDropdownButton() {
    return DropdownButton(
      hint: Text('Choose'),
      value: selectedItem,
      items: <String>[
        'Always',
        'Rare',
      ].map(
        (String value) {
          return DropdownMenuItem(
            child: Text('$value'),
            value: value,
          );
        },
      ).toList(),
      onChanged: (value) {
        print(value);
        setState(() {
          selectedItem = value;
        });
      },
    );
  }
}
