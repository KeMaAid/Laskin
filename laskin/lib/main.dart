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
  void setSaved(int value){
    this.setState(() {
      _savedNumber = value;
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
    setSaved(0);
    _opValue=0;
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
        setCurrent(getSaved()-getCurrent());
        break;
      case 3:
        setCurrent(getCurrent() * getSaved());
        break;
      case 4:
        setCurrent((getSaved() / getCurrent()).round());
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
              Container(
                constraints: BoxConstraints.expand(
                  height: 100.0,
                ),
                alignment: Alignment.bottomRight,
                color: Colors.white,
                child: Text(
                  getCurrent().toString(),
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  NewButton(text: "1", onPressed: () => handleNumButtonEvent(1),),
                  NewButton(text: "2", onPressed: () => handleNumButtonEvent(2),),
                  NewButton(text: "3", onPressed: () => handleNumButtonEvent(3),),
                  NewButton(text: "+", onPressed: () => handleAdditionEvent(),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  NewButton(text: "4", onPressed: () => handleNumButtonEvent(4),),
                  NewButton(text: "5", onPressed: () => handleNumButtonEvent(5),),
                  NewButton(text: "6", onPressed: () => handleNumButtonEvent(6),),
                  NewButton(text: "-", onPressed: () => handleSubtractionEvent(),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  NewButton(text: "7", onPressed: () => handleNumButtonEvent(7),),
                  NewButton(text: "8", onPressed: () => handleNumButtonEvent(8),),
                  NewButton(text: "9", onPressed: () => handleNumButtonEvent(9),),
                  NewButton(text: "*", onPressed: () => handleMultiplicationEvent(),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  NewButton(text: "C", onPressed: () => handleClearEvent(),),
                  NewButton(text: "0", onPressed: () => handleNumButtonEvent(0),),
                  NewButton(text: "=", onPressed: () => handleEqualEvent(),),
                  NewButton(text: "/", onPressed: () => handleDivideEvent(),),
                ],
              )
            ],
          ),
        )
    );
  }
}

class NewButton extends StatelessWidget{
  final text;
  final onPressed;

  const NewButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        child: Material(
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(200.0) ),
          elevation: 18.0,
          color: Color(0xFF801E48),
          clipBehavior: Clip.antiAlias,
          child: MaterialButton(
            minWidth: 100.0,
            height: 100.0,
            child: Text(text,
                style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0)),
            textColor: Colors.black,
            color: Colors.grey[100],
            onPressed: onPressed,
          ),
        )
    );
  }
}
