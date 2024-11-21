import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter username"
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter password"
            ),
          ),
          ElevatedButton(onPressed: () async {
            String username = usernameController.text;
            String password = passwordController.text;

            if (username.isNotEmpty && password.isNotEmpty) {

            final SharedPreferences prefs = await SharedPreferences.getInstance();
           
              await prefs.setBool('isLogged', true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            }
            else{
               showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please enter both username and password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
            }
            }
          , child: Text("Login")
          ),
           
        ],
      ),
    );
  }
}