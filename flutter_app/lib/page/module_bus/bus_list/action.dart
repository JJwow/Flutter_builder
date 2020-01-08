import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum bus_listAction { queryBusListData, updateList }

class bus_listActionCreator {
  static Action onQueryBusListData() {
    return const Action(bus_listAction.queryBusListData);
  }
  static Action onUpdateList() {
    return const Action(bus_listAction.updateList);
  }
}
