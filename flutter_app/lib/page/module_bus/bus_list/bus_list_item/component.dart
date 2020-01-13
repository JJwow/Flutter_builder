import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class bus_list_itemComponent extends Component<bus_list_itemState> {
  bus_list_itemComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<bus_list_itemState>(
                adapter: null,
                slots: <String, Dependent<bus_list_itemState>>{
                }),);

}
