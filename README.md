# flutter-demo

flutter日渐成熟，文档日趋完善，可以写demo了。

这个repo会一点一点加入东西，直到完全作出一款app为止。

因为是自己写开源项目，会加上注释，慢慢写

----------------------------
以下是redux部分讲解

## Key Concepts

  * `State` 是不可以直接被修改的，它位于`Store`中部件层次结构的顶部.
  * `StoreProvider`是一个把`Store`派发给连接的所有控件的`InheritedWidget`（继承组件）
  * `State`是不可以直接被修改。要更新`State`，必须发送一个`Action`。
  * `Action`会被`Reducer`拦截到，`Reducers` 是一个纯函数，它基于以前的`State`和`Action`的类型构建，并返回一个新的`State`.
  * 当有新的`State`时，使用`StoreConnector`连接到`Store`的所有部件都将重新构建。
  * 使用`StoreConnectors`的 部件称为 `container` 部件，他们只负责将最新的`State`转换为`ViewModel`
  * 显示数据的部件 称为`presentation`部件。例如`Text`或`FloatingActionButton`。
  * 要从中读取数据`State`，请使用`selector`函数。就像查询`state db`一样。
  * 要处理从我们的数据库或Web服务中获取数据，我们使用`Middleware`中间件.
  
## App State 单例

在Redux中，`State`会被储存在 根级单例 中。

redux 有一个核心原则是：提升状态。在这种情况下，我们将应用程序状态提升到应用程序的顶部，以便所有子级都可以访问它。

之后需要创建一个Redux `Store`并将其交给 `StoreProvider`。`StoreProvider`可以使用`StoreProvider.of(context).store`或使用 `StoreConnector` 部件访问`Store`中连接的所有子级。

## 更新 App State

要在Redux中更新状态，必须发送一个Action。

`Action被``Reducer`函数拦截，该函数负责使用包含在`Action`中的数据 并更新`State`。

`Reducer`函数是纯函数。负责接收`Action`中包含的操作类型 和 最新的`State`,并返回一个新的`State`。

这意味着`Reducer`函数不应进行任何API调用或具有诸如日志记录之类的副作用等异步操作。如果要进行这些操作，请使用Middleware中间件。
  
## 更新 UI

每当`State`发生变化时，为了响应`Action`，很可能以某种方式来更新UI。

如果`State`发生变化，要更新UI，需要用到`StoreConnector`部件，将部件与`Store`进行连接，`StoreConnector`的工作很简单：获取商店的最新状态并将其转换为 ViewModel。然后，使用它重新构建当前的部件树ViewModel。

为了便于测试部件和公共部分，建议用两种类型的部件：

  * container 部件 - 他会使用`StoreConnector`部件将ViewModel 重新构建在 `presentation`部件中.
  * presentation 部件 - 提供所需所有数据的 `StatelessWidget` 负责构建UI。
  
这使您可以更轻松地测试 presentation 部件，因为您只需要在每个测试中传递他们需要的数据进行渲染，然后针对渲染的输出编写断言。将它们视为我们UI的“纯函数”。

它还允许您重用container部件。例如，请查看AppLoading 部件。

## Selector 函数

Selector函数是简单的函数，提供对应用程序状态的单点访问。有关它们有用的原因的完整说明，请参阅[reselect](https://pub.dartlang.org/packages/reselect)包

## 使用中间件获取和存储数据

为了从Web或数据库中获取我们的Todos，我们需要进行异步调用。由于Reducer函数是纯函数，我们必须使用Middleware。

Middleware运行以响应Actions调度，并在执行之前执行Reducer。这意味着可以在中间件中拦截和获取数据！

## 测试

通常，这个应用程序符合“测试金字塔”：大量的单元测试，更少的部件测试和更少的集成测试。

  * 单元测试
    - Reducer 函数很容易进行单元测试，因为它们是纯函数
    - Middleware 调用API的函数可以使用Mock实现进行测试。这是使用Mockito库完成的。
    - selector 函数也很容易测试，因为它们是纯函数。
  * Widget 测试
    - container 可以测试部件以确保它们生成正确的ViewModel。
    - presentation 可以通过传入假数据并对使用该数据 presentation的部件 进行断言来测试部件。
  * 集成测试
    - 运行应用程序并使用flutter_driver驱动它flutter drive --target test_driver/todo_app.dart。
    - 使用“页面对象模型（Page Object Model）”模式使测试更易于阅读和维护。
    
