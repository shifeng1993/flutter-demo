// 主入口是为了连接redux，降低耦合
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

// 引入根组件
import './App.dart';

// 引入store
import './store/index.dart';
import './store/states/MainState.dart';

// 根组件
class Main extends StatelessWidget {
  final store = createStore();
  Main();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<MainState>(
      store: createStore(),
      child: App(),
    );
  }
}

// 输出渲染
void main() {
  runApp(Main());
  if (Platform.isAndroid) {
    // 设置android状态栏为透明的沉浸。
    // 写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
