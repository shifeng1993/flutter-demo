import 'package:flutter/material.dart';
import './pages/index.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => new AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => new HomeScreen(),
        '/My': (BuildContext context) => new MyScreen(),
        '/Cart': (BuildContext context) => new CartScreen(),
      },
    );
  }
}
