import 'package:counter_bloc/screens/data/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInit());

  //* method to incremet
  void increment() {
    emit(CounterUpdate(state.count + 1));
  }

  //* method to decrement
  void decrement() {
    emit(CounterUpdate(state.count - 1));
  }
}
