import 'package:flutter/material.dart';
import 'package:blogs/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    home: new Home(),
  ));
}
