// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_11/layouts/counter/cubit/cubit.dart';
import 'package:flutter_application_11/layouts/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (BuildContext context, state) {
          if (state is CounterPlusState) {
            print('Plus state is : ${state.counter}');
          }
          if (state is CounterMinusState) {
            print('Minus state is : ${state.counter}');
          }
        },
        builder: (BuildContext context, state) {
          CounterCubit cubit = CounterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Counter'),
              centerTitle: true,
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () => cubit.plus(),
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Text(
                      '${cubit.counter}',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () => cubit.minus(),
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _incrementCounter(context) {
    CounterCubit.get(context).counter++;
  }

  void _decrementCounter(context) {
    CounterCubit.get(context).counter--;
  }
}
