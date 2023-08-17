import 'package:card_animation/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //devDiariesWithVee on Instagram
  //devDiariesWithVee on Youtube
  //vaidehi2701 on Github

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Card Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StarbucksDrinks(),
    );
  }
}
