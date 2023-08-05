import 'package:flutter_riverpod/flutter_riverpod.dart';

final myDataProvider =
      StateNotifierProvider<MyData, double>((ref) => MyData());

class MyData extends StateNotifier<double> {
  MyData() : super(0.5);

  void changeState(state) => this.state = state;
}
