import 'package:meta/meta.dart';

@immutable
class CounterState {
  final int count;//이것이 counter를 위해 사용되어질 state이다.

  CounterState({@required this.count});

  factory CounterState.empty() {
    return CounterState(count: 0);
  }//state는 초기화 과정이 필요하게 되는데 이를 위한 것이다.

  CounterState update({
    int count,
  }) {
    return copyWith(count: count);
  } //bloc에서의 state업데이트를 위해 사용하게 되는 것이다.

  CounterState copyWith({
    int count,
  }) {
    return CounterState(count: count ?? this.count);
  }
}