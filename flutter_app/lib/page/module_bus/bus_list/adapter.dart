import 'package:fish_redux/fish_redux.dart';
import 'state.dart';
import 'bus_list_item/component.dart';
import 'bus_list_item/state.dart';
class bus_listAdapter extends DynamicFlowAdapter<bus_listState> {
  bus_listAdapter()
      : super(
          pool: <String, Component<Object>>{
            "BusItem":bus_list_itemComponent(),
          },
          connector: _bus_listConnector(),
          );
}

class _bus_listConnector extends ConnOp<bus_listState, List<ItemBean>> {
  @override
  List<ItemBean> get(bus_listState state) {
    //判断bus_listState里面的items数据是否为空
    if(state.bus_list_items?.isNotEmpty == true){
      //若不为空，把item数据转化成ItemBean的列表
      return state.bus_list_items
          .map<ItemBean>((bus_list_itemState data) => ItemBean('BusItem',data))
          .toList(growable: true);
    }
    return <ItemBean>[];
  }

  @override
  void set(bus_listState state, List<ItemBean> items) {
    //把ItemBean的变化，修改到item的state的过程
    if (items?.isNotEmpty == true){
      state.bus_list_items = List<bus_list_itemState>.from(
        items.map<ItemBean>((ItemBean bean) => bean.data).toList()
      );
    } else {
      state.bus_list_items = <bus_list_itemState>[];
    }
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
