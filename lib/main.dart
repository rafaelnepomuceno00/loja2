import 'package:flutter/material.dart';
import 'package:loja2/models/user_model.dart';
import 'package:loja2/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'loja',
        theme: ThemeData(
          accentColor: Color.fromARGB(255, 165, 200, 200),
          primarySwatch: Colors.red,
          primaryColor: Color.fromARGB(255, 165, 200, 200),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}
