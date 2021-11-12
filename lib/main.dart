import 'package:flutter/material.dart';
import 'package:flutter_app_mvm_sample/model.dart';

import 'package:mvp/mvp.dart';

import 'presenter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVP Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(title: 'MVP Demo'),
    );
  }
}

class MainScreen extends StatefulWidget {
  final presenter = MainPresenter();

  MainScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends MvpScreen<MainScreen, MainModel> {

  @override
  void initializeViewModel() {
    viewModel = MainModel();
  }

  @override
  void initState() {
    super.initState();
    // Always remember to bind the presenter in initState().
    widget.presenter.bind(applyState, this);
  }

  @override
  void dispose() {
    super.dispose();
    // And remember to release presenter binding in dispose().
    widget.presenter.unbind();
  }

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
            Text(
             viewModel.counter.toString(),
              style: TextStyle(fontSize: 20,color: Colors.deepOrange),
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [

          FloatingActionButton(
        onPressed: () {
            widget.presenter.incrementButtonClick();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                widget.presenter.decrementButtonClick();
              },
              tooltip: 'Decrement',
              child: Icon(Icons.remove, color: Colors.deepOrange,),
            ),
    ]
    ),

    );
  }
}