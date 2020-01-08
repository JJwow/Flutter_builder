import 'package:fish_redux/fish_redux.dart';

class bus_listState implements Cloneable<bus_listState> {

  @override
  bus_listState clone() {
    return bus_listState();
  }
}

bus_listState initState(Map<String, dynamic> args) {
  return bus_listState();
}
