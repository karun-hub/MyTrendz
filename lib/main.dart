import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/Backend/Config.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Main_pages/HomePage.dart';
import 'Main_pages/Showalldetails.dart';
import 'Main_pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EcommerceApp.auth= FirebaseAuth.instance;
  EcommerceApp.sharedPreferences = await SharedPreferences.getInstance();
  EcommerceApp.firestore = Firestore.instance;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/Showalldetails': (context) => ShowallDetails()},
      home: LoginApp(),
    );
  }
}
