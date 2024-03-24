import 'package:flutter/material.dart';
import 'pages/navigation.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Setting debugShowCheckedModeBanner to false
      theme: ThemeData(useMaterial3: true),
      home: SplashScreen(), // Changed to SplashScreen
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Adding a delay before navigating to the main screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: Center(
        child: Image.asset('assets/cent.png'), // Your image icon
      ),
    );
  }
}
