import 'package:flutter/material.dart';
import 'package:personal_ai/views/welcomePage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: WelcomePage());
  }
}
// AIzaSyCorK5GW4OXnCQ6QRqsJJGrY0tU8appaLM