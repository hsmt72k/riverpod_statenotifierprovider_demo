import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './my_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, child) {
            final value = ref.watch(myDataProvider); 
            return Text(
              value.toStringAsFixed(2),
              style: const TextStyle(fontSize: 100),
            );
          }),
          Consumer(builder: (context, ref, child) {
            return Slider(
              value: ref.watch(myDataProvider),
              onChanged: (value) =>
                  ref.read(myDataProvider.notifier).changeState(value),
            );
          }),
        ],
      ),
    );
  }
}
