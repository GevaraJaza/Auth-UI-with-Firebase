import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:peshang/Pages/Login_Page.dart';
import 'package:peshang/Auth/main_page.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MainPage(),));
}

