import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum bus_list_itemAction { action }

class bus_list_itemActionCreator {
  static Action onAction() {
    return const Action(bus_list_itemAction.action);
  }
}
