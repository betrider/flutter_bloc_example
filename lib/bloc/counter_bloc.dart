import 'package:bloc/bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc2 extends Bloc<CounterEvent, CounterState> {
  CounterBloc2() : super(CounterState.empty());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is PageLoaded) {
      yield* _mapPageLodaedToState();
    } else if (event is IncrementBtnPressed) {
      yield* _mapIncrementBtnPressedToState();
    } else if (event is DecrementBtnPressed) {
      yield* _mapDecrementBtnPressedToState();
    }
  }//각각 이벤트에 따라 실행이 되게될 bloc들을 if문을 통해 분류하여 준다.

  Stream<CounterState> _mapPageLodaedToState() async* {
    yield state.update(count: 0);
  }//처음 페이지가 불리게 되면 사용되어진다.

  Stream<CounterState> _mapIncrementBtnPressedToState() async* {
    yield state.update(count: state.count + 1);
  }//증가 버튼을 부르게 되면 사용되어진다

  Stream<CounterState> _mapDecrementBtnPressedToState() async* {
    yield state.update(count: state.count - 1);
  }//감소 버튼을 부르게 되면 사용되어진다.
}