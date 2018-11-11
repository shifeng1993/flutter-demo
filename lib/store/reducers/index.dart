import 'package:redux/redux.dart';
import '../states/MainState.dart';
import '../actions/index.dart';

List<String> addItemReducer(List<String> items, AddItemAction action) {
  return List.from(items)..add(action.item);
}

List<String> removeItemReducer(List<String> items, RemoveItemAction action) {
  return List.from(items)..remove(action.item);
}

// 把reducer的函数合并到 `itemsReducer`.
Reducer<List<String>> reducers = combineReducers<List<String>>([
  TypedReducer<List<String>, AddItemAction>(addItemReducer),
  TypedReducer<List<String>, RemoveItemAction>(removeItemReducer),
]);

// 和以前一样使用reducer
MainState appReducer(MainState state, action) =>
    MainState(reducers(state.items, action));
