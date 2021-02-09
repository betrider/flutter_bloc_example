import 'package:meta/meta.dart';

@immutable
abstract class CounterEvent {}

class PageLoaded extends CounterEvent{
  @override
  String toString() {
    return 'page loaded';
  }
}//제일 처음 페이지가 불리게 되면 실행될 작업을 위해 선언한 이벤트

class IncrementBtnPressed extends CounterEvent{
  @override
  String toString() {
    return "Increment button pressed";
  }
}//증가 버튼을 누르게되면 발생할 event

class DecrementBtnPressed extends CounterEvent{
  @override
  String toString() {
    return "Decrement button pressed";
  }
}//감소 버튼을 누르게 되면 발생할 event