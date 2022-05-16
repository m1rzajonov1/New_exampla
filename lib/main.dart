import 'package:flutter/material.dart';
import 'package:newproectap/screens/home_page/home_page_view.dart';
import 'package:newproectap/screens/loader_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoaderPage(),
    );
  }
}

