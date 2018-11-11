// Splash
import 'package:flutter/material.dart';
import '../../routes/AppNavigator.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Splash'),
          leading: FlatButton(
            child: Text('返回'),
            onPressed: () => navigator.navigateTo(context, '/cart'),
          ),
        ),
        body: Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}
