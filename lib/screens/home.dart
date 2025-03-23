// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:counter_bloc/screens/data/counter_cubit.dart';
import 'package:counter_bloc/screens/data/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Counter Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: BlocProvider(
          create: (context) {
            return CounterCubit();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  log("child");
                  return Text(
                    state.count.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().increment();
                        },
                        child: Text(
                          "Increase",
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  ),
                  Gap(20),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().decrement();
                        },
                        child: Text(
                          "decrease",
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
