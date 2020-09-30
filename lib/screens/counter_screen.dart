import 'package:calendar/bloc/counter_bloc.dart';
import 'package:calendar/bloc/counter_event.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  final _bloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Bloc'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
          child: StreamBuilder(
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You have pushed button this many times:'),
              Text('${snapshot.data}'),
            ],
          );
        },
        stream: _bloc.counter,
        initialData: 0,
      )),
    );
  }
}
