import 'package:meta/meta.dart';

@immutable
class MainState {
  final List<String> items;

  MainState(this.items);

  @override
  String toString() {
    return '''AppState{
            items: $items
        }''';
  }
}
