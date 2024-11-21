import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/splash_screen/splash_screen.dart';

void main(){
runApp(MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}