import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';

import './reducers/index.dart';
import './states/MainState.dart';

Store<MainState> createStore() {
  Store<MainState> store = Store(
    appReducer,
    initialState: MainState([]),
    middleware: [LoggingMiddleware.printer(), thunkMiddleware],
  );
  return store;
}
