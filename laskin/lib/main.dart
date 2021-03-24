import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: new ThemeData.dark(),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _savedNumber = 0;
  int _currentNumber = 0;
  int _opValue =0;
  //1 sum
  //2 sub
  //3 mul
  //4 div
  

  void currentToSaved(){
    this.setState(() {
      _savedNumber = _currentNumber;
      _currentNumber = 0;
    });}
  void setCurrent(int value){
    this.setState(() {
      _currentNumber = value;
    });
  }
  int getSaved(){
    return _savedNumber;
  }
  int getCurrent(){
    return _currentNumber;
  }

  void handleClearEvent(){
    setCurrent(0);
    currentToSaved();
  }

  void handleAdditionEvent(){
    currentToSaved();
    _opValue = 1;
  }
  void handleSubtractionEvent(){
    currentToSaved();
    _opValue = 2;
  }
  void handleMultiplicationEvent(){
    currentToSaved();
    _opValue = 3;
  }
  void handleDivideEvent(){
    currentToSaved();
    _opValue = 4;
  }
  void handleEqualEvent() {
    switch (_opValue) {
      case 1:
        setCurrent(getCurrent() + getSaved());
        break;
      case 2:
        setCurrent(getCurrent() - getSaved());
        break;
      case 3:
        setCurrent(getCurrent() * getSaved());
        break;
      case 4:
        setCurrent((getCurrent() / getSaved()).round());
        break;
      default:
        print('ERROR IN OPERATION CODE');
        break;
    }
  }
  void handleNumButtonEvent(int value){
    setCurrent(int.parse(getCurrent().toString()+value.toString()));
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Calculator"),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _Display(

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _NumButton(value: 1, onPressed: handleNumButtonEvent,),
                  _NumButton(value: 2, onPressed: handleNumButtonEvent,),
                  _NumButton(value: 3, onPressed: handleNumButtonEvent,),
                  _AddButton(onPressed: handleAdditionEvent,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _NumButton(value: 4, onPressed: handleNumButtonEvent,),
                  _NumButton(value: 5, onPressed: handleNumButtonEvent,),
                  _NumButton(value: 6, onPressed: handleNumButtonEvent,),
                  _SubtractButton(onPressed: handleSubtractionEvent,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _NumButton(value: 7, onPressed: handleNumButtonEvent,),
                  _NumButton(value: 8, onPressed: handleNumButtonEvent,),
                  _NumButton(value: 9, onPressed: handleNumButtonEvent,),
                  _MultiplicationButton(onPressed: handleMultiplicationEvent,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _ClearButton(onPressed: handleClearEvent,),
                  _NumButton(value: 0, onPressed: handleNumButtonEvent,),
                  _EqualButton(onPressed: handleEqualEvent,),
                  _DivideButton(onPressed: handleDivideEvent,),
                ],
              )
            ],
          ),
        )
    );
  }
}
/*
@override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Display(),
            Row(
              children: [GridView.count(
                crossAxisCount: 3,
                children: [
                  for (var i=1; i>=9; i++) _NumButton(value: i, onPressed: handleNumButtonEvent),
                ], // NUMButtons
                  ),
                Column(
                  children: [
                    _AddButton(
                      onPressed: handleAdditionEvent,
                    ),
                    _SubtractButton(
                      onPressed: handleSubtractionEvent,
                    ),
                    _EqualButton(
                      onPressed: handleEqualEvent,
                    ),
                  ], // operation buttons
                ),
                ],
            )],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/

//########################################################
//Display
//########################################################
class _Display extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      constraints: BoxConstraints.expand(
        height: 100.0,
      ),
      alignment: Alignment.bottomRight,
      color: Colors.white,
      child: Text(
        "0",
        style: TextStyle(
            fontSize: 50.0,
            color: Colors.black
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}

//#########################################################
//Number button
//#########################################################
class _NumButton extends StatelessWidget{
  final int value;
  final Function onPressed;

  Function handleClick(){
    this.onPressed(value);
  }

  const _NumButton({this.value, this.onPressed});

  @override
  Widget build(BuildContext context){
    return MaterialButton(
      height: 125.0,
      textColor: Colors.black,
      color: Colors.grey[100],
        onPressed: handleClick,
        child: Text(
          value.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0)),
    );
  }
}


//#######################################################
//operation buttons
//#######################################################

class _AddButton extends StatelessWidget{
  final Function onPressed;

  const _AddButton({this.onPressed});


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 125.0,
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: onPressed,
      child: Text('+',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
      ),
    );
  }
}

class _SubtractButton extends StatelessWidget{
  final Function onPressed;

  const _SubtractButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 125.0,
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: onPressed,
      child: Text('-',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
      ),
    );
  }
}

class _MultiplicationButton extends StatelessWidget{
  final Function onPressed;

  const _MultiplicationButton({this.onPressed});


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 125.0,
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: onPressed,
      child: Text('*',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
      ),
    );
  }
}

class _DivideButton extends StatelessWidget{
  final Function onPressed;

  const _DivideButton({this.onPressed});


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 125.0,
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: onPressed,
      child: Text('/',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
      ),
    );
  }
}

class _EqualButton extends StatelessWidget{
  final Function onPressed;

  const _EqualButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 125.0,
        textColor: Colors.black,
        color: Colors.grey[100],
        onPressed: onPressed,
        child: Text('=',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
        ),
    );
  }
}

class _ClearButton extends StatelessWidget{
  final Function onPressed;

  const _ClearButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 125.0,
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: onPressed,
      child: Text('C',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
      ),
    );
  }
}

