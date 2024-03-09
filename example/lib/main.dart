import 'package:flutter/material.dart';
import 'package:tlt_design/tlt_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tlt Design',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(title: const Text('TLT Design Example App')),
      body: const Column(
        children: [
          Row(
            children: [
              Icon(TltIcons2.activity),
              Icon(TltIcons2.activity1),
              Icon(TltIcons2.activity2),
              Icon(TltIcons2.activity3),
              Icon(TltIcons2.activity4),
              Icon(TltIcons2.activity5),
            ],
          ),
          Row(
            children: [
              Icon(TltIcons2.add),
              Icon(TltIcons2.add1),
              Icon(TltIcons2.add2),
              Icon(TltIcons2.add3),
              Icon(TltIcons2.add4),
              Icon(TltIcons2.add5),
            ],
          ),
          Row(
            children: [
              Icon(TltIcons2.add_circle),
              Icon(TltIcons2.add_circle1),
              Icon(TltIcons2.add_circle2),
              Icon(TltIcons2.add_circle3),
              Icon(TltIcons2.add_circle4),
              Icon(TltIcons2.add_circle5),
            ],
          ),
          Row(
            children: [
              Icon(TltIcons2.add_square),
              Icon(TltIcons2.add_square1),
              Icon(TltIcons2.add_square2),
              Icon(TltIcons2.add_square3),
              Icon(TltIcons2.add_square4),
              Icon(TltIcons2.add_square5),
            ],
          ),
          Row(
            children: [
              Icon(TltIcons2.additem),
              Icon(TltIcons2.additem1),
              Icon(TltIcons2.additem2),
              Icon(TltIcons2.additem3),
              Icon(TltIcons2.additem4),
              Icon(TltIcons2.additem5),
            ],
          ),
          Row(
            children: [
              Icon(TltIcons2.airdrop),
            ],
          ),
          Row(
            children: [
              Icon(TltIcons2.airplane),
              Icon(TltIcons2.airplane1),
              Icon(TltIcons2.airplane2),
              Icon(TltIcons2.airplane3),
              Icon(TltIcons2.airplane4),
              Icon(TltIcons2.airplane5),
            ],
          ),
          Row(
            children: [
              Icon(TltIcons2.airplane_square),
              Icon(TltIcons2.airplane_square1),
              Icon(TltIcons2.airplane_square2),
              Icon(TltIcons2.airplane_square3),
              Icon(TltIcons2.airplane_square4),
              Icon(TltIcons2.airplane_square5),
            ],
          ),
          Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: TltColors.blueGray,
                ),
                child: Icon(
                  TltIcons2.bag_tick_2,
                  color: TltColors.indigo,
                ),
              ),
              Icon(TltIcons2.bag_tick_21),
              Icon(TltIcons2.bag_tick_22),
              Icon(TltIcons2.bag_tick_23),
              Icon(TltIcons2.bag_tick_24),
              Icon(
                TltIcons2.bag_tick_25,
                color: TltColors.purple,
              ),
            ],
          ),
          Row(
            children: [
              Icon(TltIcons2.arrow_3),
              Icon(TltIcons2.arrow_31),
              Icon(TltIcons2.arrow_32),
              Icon(TltIcons2.arrow_33),
              Icon(TltIcons2.arrow_34),
              Icon(TltIcons2.arrow_35),
            ],
          ),
        ],
      ),
    );
  }
}
