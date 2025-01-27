import 'package:flutter/material.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Kanit App',
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Colors.amber,
      ),
      
      initialRoute: '/register',
      routes: {
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(
              title: '',
              firstName: '',
              lastName: '',
            ),
      },
    );
  }
}