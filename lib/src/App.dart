import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

// 引入store
import './store/index.dart';
import './store/states/AppState.dart';
// 引入页面
import './pages/index.dart';

class App extends StatelessWidget {
  final store = createStore();
  App();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData.dark(),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => new HomeScreen(),
          '/My': (BuildContext context) => new MyScreen(),
          '/Cart': (BuildContext context) => new CartScreen(),
        },
      ),
    );
  }
}
