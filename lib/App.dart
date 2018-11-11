import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

// 引入AppNavigator实体类
import './routes/AppNavigator.dart';

// 引入Routes配置
import './routes/Routes.dart';

class App extends StatefulWidget {
  const App();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  _AppState() {
    final router = Router(); // 创建一个常量
    Routes.configureRoutes(router); // 配置构造路由
    AppRouter.set(router); // 添加到实体类内
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        platform: TargetPlatform.iOS, // 使用ios的界面动画方式
        primaryColor: const Color(0xffd33b32), // 应用主要部分的背景颜色（工具栏，标签栏等）
        accentColor: Colors.white, // 前景色：旋钮，文本，过度滚动边缘效果等
      ),
      onGenerateRoute: AppRouter.get().generator, // 使用路由构建
    );
  }
}
