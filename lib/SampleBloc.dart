import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

abstract class CounterEvent {}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int>{
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    if(event is IncrementCounter){
      yield state + 1;
    }else if(event is DecrementCounter){
      yield state + -1;
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
              onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.remove),
              onPressed: () => context.read<CounterBloc>().add(DecrementCounter()),
            ),
          ),
        ],
      ),
    );
  }
}
