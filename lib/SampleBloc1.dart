//1.bloc abstract 버전
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

abstract class CounterEvent1 {}

class IncrementCounter1 extends CounterEvent1 {}

class DecrementCounter1 extends CounterEvent1 {}

class CounterBloc1 extends Bloc<CounterEvent1, int> {
  CounterBloc1() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent1 event) async* {
    print('event: $event');
    print('state: $state');
    if (event is IncrementCounter1) {
      yield state + 1;
    } else if (event is DecrementCounter1) {
      yield state + -1;
    }
  }

  @override
  void onEvent(CounterEvent1 event) {
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
  void onTransition(Transition<CounterEvent1, int> transition) {
    print(transition);
    super.onTransition(transition);
  }
}

class SampleBloc1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build1');
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterBloc1, int>(
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
              onPressed: () =>
                  context.read<CounterBloc1>().add(IncrementCounter1()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.remove),
              onPressed: () =>
                  context.read<CounterBloc1>().add(DecrementCounter1()),
            ),
          ),
        ],
      ),
    );
  }
}

//2.bloc enum 버전
/* import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

enum EventStatus { IncrementCounter, DecrementCounter }

class CounterEvent {
  final int value;
  final EventStatus status;

  CounterEvent(this.value, this.status);
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    print('event.status:${event.status}');
    print('event.value:${event.value}');
    if (event.status == EventStatus.IncrementCounter) {
      yield state + event.value;
    } else if (event.status == EventStatus.DecrementCounter) {
      yield state - event.value;
    }
  }

  @override
  void onEvent(CounterEvent event) {
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
  void onTransition(Transition<CounterEvent, int> transition) {
    print(transition);
    super.onTransition(transition);
  }
}

class SampleBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build1');
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
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
                  .read<CounterBloc>()
                  .add(CounterEvent(1, EventStatus.IncrementCounter)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.remove),
              onPressed: () => context
                  .read<CounterBloc>()
                  .add(CounterEvent(1, EventStatus.DecrementCounter)),
            ),
          ),
        ],
      ),
    );
  }
}
 */
