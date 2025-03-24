import 'package:counter_bloc/screens/bloc/counter_event.dart';
import 'package:counter_bloc/screens/data/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInit()) {
    on<IncrementEvent>((event, emit) {
      emit(CounterUpdate(state.count + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterUpdate(state.count - 1));
    });
  }
}
