import 'package:flutter/material.dart';
import 'package:sih/screens/loginpage.dart';
// import 'package:sih/screens/homescreen.dart';
void main(){
  runApp(sihapp());
}

class sihapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
    
  }
}