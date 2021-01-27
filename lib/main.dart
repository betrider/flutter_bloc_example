import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/SampleBloc.dart';
import 'package:flutter_bloc_example/SampleCubit.dart';

class MyBlocObserver extends BlocObserver {
  //블럭 전역 옵저버(내부동작 이후 옵저버작동)

  @override
  void onCreate(Cubit cubit) {
    super.onCreate(cubit);
    print('BlocObserver onCreate -- cubit: ${cubit.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('BlocObserver onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(Cubit cubit, Change change) {
    super.onChange(cubit, change);
    print('BlocObserver onChange -- cubit: ${cubit.runtimeType}, change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('BlocObserver onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('BlocObserver onError -- cubit: ${cubit.runtimeType}, error: $error');
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onClose(Cubit cubit) {
    super.onClose(cubit);
    print('onClose -- cubit: ${cubit.runtimeType}');
  }
}

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: BlocBuilder<CounterCubit, int>(
                builder: (context, count) {
                  print('main cubit build');
                  return Text('cubit $count');
                },
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SampleCubit(),
                    )
                );
              },
            ),
            RaisedButton(
              child: BlocBuilder<CounterBloc, int>(
                builder: (context, count) {
                  print('main bloc build');
                  return Text('bloc $count');
                },
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SampleBloc(),
                    )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
