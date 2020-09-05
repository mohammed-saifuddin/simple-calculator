import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import "package:math_expressions/math_expressions.dart";
import "package:flutter/cupertino.dart";
import "package:simplecalculator/SplashScreen.dart";
void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "calculator",
  home: SplashScreen(),
));
class myApp extends StatelessWidget {
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"calculator",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        
      
      ),
      home:SimpleCalculator(),

    );

  }
}
class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation="0";
  String result="0";
  String expression="0";
  double equationFontsize=30.0;
  double resultFontSize=35.0;
  void buttonPressed(String buttonText){
    setState(() {
      if(buttonText =="C"){
        equation="0";
        result="0";
        equationFontsize=30.0;
        resultFontSize=35.0;

      }else if(buttonText =="B"){
        equationFontsize=35.0;
        resultFontSize=30.0;
        equation =equation.substring(0,equation.length-1);
        if(equation==""){
          equation="0";
        }
      }else if(buttonText =="="){
        equationFontsize=30.0;
        resultFontSize=35.0;
        expression=equation;
        expression =expression.replaceAll("x", "*");
        try{

          Parser p= new Parser();
          Expression exp=p.parse(expression);
          ContextModel cm=ContextModel();
          result= "${exp.evaluate(EvaluationType.REAL, cm)}";
        }catch(e){
          result="Syntax error";
        }


      }else {
        equationFontsize=30.0;
        resultFontSize=35.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });

  }
  Widget buildButton(String buttonText,double buttonHeight,Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 *buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side:BorderSide(
              color: Colors.tealAccent,
              width:1,
              style: BorderStyle.solid,
            )
        ),
        padding: EdgeInsets.all(10.0),
        onPressed:()=>buttonPressed( buttonText),

        child: Text(
          "$buttonText",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
 Widget buildButtonCalculate(String buttonText,double buttonHeight,Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 *buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side:BorderSide(
              color: Colors.tealAccent,
              width:1,
              style: BorderStyle.solid,
            )
        ),
        padding: EdgeInsets.all(10.0),
        onPressed:()=>buttonPressed( buttonText),

        child: Text(
          "$buttonText",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.teal,
          ),
        ),
      ),
    );
  } 
  Widget equals(String buttonText,double buttonHeight,Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 *buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side:BorderSide(
              color: Colors.tealAccent,
              width:1,
              style: BorderStyle.solid,
            )
        ),
        padding: EdgeInsets.all(10.0),
        onPressed:()=>buttonPressed( buttonText),

        child: Text(
          "$buttonText",
          style: TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.normal,
            color: Colors.teal,
          ),
        ),
      ),
    );
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text("$equation",style: TextStyle(fontSize: equationFontsize),maxLines:3,),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text("$result",style: TextStyle(fontSize: resultFontSize),maxLines: 2,),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width *.75,
                  child: Table(
                    children: [
                      TableRow(
                          children: [
                            buildButtonCalculate("C", 1, Colors.white),
                            buildButton("B", 1, Colors.white),
                            buildButton("+", 1, Colors.white),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButton("7", 1, Colors.white),
                            buildButton("8", 1, Colors.white),
                            buildButton("9", 1, Colors.white),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButton("4", 1, Colors.white),
                            buildButton("5", 1, Colors.white),
                            buildButton("6", 1, Colors.white),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButton("1", 1, Colors.white),
                            buildButton("2", 1, Colors.white),
                            buildButton("3", 1, Colors.white),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButton(".", 1, Colors.white),
                            buildButton("0", 1, Colors.white),
                            buildButton("%", 1, Colors.white),
                          ]
                      )
                    ],
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width *.25,
                  child: Table(
                    children: [
                      TableRow(
                          children: [
                            buildButton("/",1, Colors.white),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButton("x",1, Colors.white),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButton("-",1, Colors.white),
                          ]
                      ),
                      TableRow(
                          children: [
                            equals("=",2, Colors.white),
                          ]
                      ),
                    ],
                  ),
                )

              ]
          )
        ],
      ),
    );

  }
}