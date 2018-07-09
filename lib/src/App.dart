import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

// 引入路由
import './routes/index.dart';

// 引入store
import './store/index.dart';
import './store/states/AppState.dart';

class App extends StatelessWidget {
  final store = createStore();
  App();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: createStore(),
      child: new Routes()
    );
  }
}
