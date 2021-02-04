import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class BlocMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc2, CounterState>(
        builder: (BuildContext context, CounterState state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${state.count}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),

            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
            //store btn
            floatingActionButton: Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton(
                      heroTag: null,
                      child: Icon(Icons.remove),
                      onPressed: () {
                        context.read<CounterBloc2>().add(DecrementBtnPressed());
                      },
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton(
                      heroTag: null,
                      child: Icon(Icons.add),
                      onPressed: () {
                        context.read<CounterBloc2>().add(IncrementBtnPressed());
                        //print(state.count);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
