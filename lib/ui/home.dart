import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home>{
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = -1;

  double _finalResult = 0.0;
  String _formattedText;

  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;

      switch(radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = 'Your weight on Mercury is ${_finalResult.toStringAsFixed(2)}';
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = 'Your weight on Venus is ${_finalResult.toStringAsFixed(2)}';
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = 'Your weight on Mars is ${_finalResult.toStringAsFixed(2)}';
          break;
        case 3:
          _finalResult = calculateWeight(_weightController.text, 2.34);
          _formattedText = 'Your weight on Jupiter is ${_finalResult.toStringAsFixed(2)}';
          break;
        case 4:
          _finalResult = calculateWeight(_weightController.text, 0.92);
          _formattedText = 'Your weight on Saturn is ${_finalResult.toStringAsFixed(2)}';
          break;
        case 5:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = 'Your weight on Uranus is ${_finalResult.toStringAsFixed(2)}';
          break;
        case 6:
          _finalResult = calculateWeight(_weightController.text, 1.19);
          _formattedText = 'Your weight on Neptune is ${_finalResult.toStringAsFixed(2)}';
          break;
        case 7:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText = 'Your weight on Pluto is ${_finalResult.toStringAsFixed(2)}';
          break;

        default:
          _formattedText = 'Please enter your weight in';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text(
            "Weight on Planet X",
            style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: new Container(
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png',height: 133.0,width: 200.0,),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your weight on Earth",
                      hintText: 'in kilograms',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0),),

                  // three radio buttons

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      // radio buttons

                      new Radio<int>(value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Mercury",
                      ),
                      new Radio<int>(value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                      ),
                      new Radio<int>(value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Mars",
                      ),
                    ],
                  ),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      // radio buttons

                      new Radio<int>(value: 3, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Jupiter",
                      ),
                      new Radio<int>(value: 4, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Saturn",
                      ),
                      new Radio<int>(value: 5, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Uranus",
                      ),
                    ],
                  ),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      // radio buttons

                      new Radio<int>(value: 6, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Neptune",
                      ),
                      new Radio<int>(value: 7, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Pluto",
                      ),
                    ],
                  ),

                  new Padding(padding: new EdgeInsets.all(10.6),),

                  // result text
                  new Text(
                    _weightController.text.isEmpty ? "Enter your weight" :
                    "$_formattedText kgs",
                    style: new TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 17.0,
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String text, double relativeGravity) {
    double _weight;
    if(double.parse(text).toString().isNotEmpty && double.parse(text) > 0){
      _weight = double.parse(text)*relativeGravity;
    } else {
      _weight = 0.0;
    }
    return _weight;
  }
}