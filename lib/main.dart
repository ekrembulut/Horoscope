import 'package:flutter/material.dart';
import 'package:horoscope_application_1/burc_listesi.dart';
import 'package:horoscope_application_1/onGenerate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          textTheme: TextTheme(headline6: TextStyle(color: Colors.white))),
      title: 'Material App',
      home: BurcListesi(),
      onGenerateRoute: OnGenerator.horoscopeRoute,
    );
  }
}
