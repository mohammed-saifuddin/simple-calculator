import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import "package:simplecalculator/main.dart";
import 'package:shimmer/shimmer.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    _mockCheckForSession().then(
            (status){
          if(status){
            _navigateToHome();
          }
        });
  }
  Future<bool> _mockCheckForSession() async{
    await Future.delayed(Duration(milliseconds:3000),(){});
    return true;
  }
  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => myApp(),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Shimmer.fromColors(
                  period: Duration(milliseconds: 2000),
                  baseColor: Colors.tealAccent,
                  highlightColor: Colors.pinkAccent,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(60, 80,30, 60),
                    child: Text('Calculator',
                      style: TextStyle(
                        fontSize: 70.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "cursive",

                      ),


                    ),
                  ),
                ),
              ]
          ),
        )

    );


  }
}
