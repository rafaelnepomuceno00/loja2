import 'package:flutter/material.dart';
import 'package:loja2/screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'loja',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color.fromARGB(255, 165, 200, 200),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
