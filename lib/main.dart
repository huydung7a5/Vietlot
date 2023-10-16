// bước 1 khai bao import thu vien

import 'package:flutter/material.dart';
import 'Edit.dart';
import 'Home.dart';
import 'package:firebase_core/firebase_core.dart';

// bước 2: main
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo app",
      routes: {
        '/': (context) => Home(),
        '/edit': (context) => Editnumber(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
