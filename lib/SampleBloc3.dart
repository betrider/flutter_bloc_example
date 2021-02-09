//2.bloc enum 버전
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

enum EventStatus { IncrementCounter, DecrementCounter }

class CounterEvent3 {
  final int value;
  final EventStatus status;

  CounterEvent3(this.value, this.status);
}

class CounterBloc3 extends Bloc<CounterEvent3, int> {
  CounterBloc3() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent3 event) async* {
    print('event.status:${event.status}');
    print('event.value:${event.value}');
    print('event: $event');
    print('state: $state');
    if (event.status == EventStatus.IncrementCounter) {
      yield state + event.value;
    } else if (event.status == EventStatus.DecrementCounter) {
      yield state - event.value;
    }
  }

  @override
  void onEvent(CounterEvent3 event) {
    print(event);
    super.onEvent(event);
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  void onTransition(Transition<CounterEvent3, int> transition) {
    print(transition);
    super.onTransition(transition);
  }
}

class SampleBloc3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build3');
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterBloc3, int>(
        builder: (context, count) {
          print('SampleBloc build');
          return Center(child: Text('$count'));
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.add),
              onPressed: () => context
                  .read<CounterBloc3>()
                  .add(CounterEvent3(1, EventStatus.IncrementCounter)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.remove),
              onPressed: () => context
                  .read<CounterBloc3>()
                  .add(CounterEvent3(1, EventStatus.DecrementCounter)),
            ),
          ),
        ],
      ),
    );
  }
}
