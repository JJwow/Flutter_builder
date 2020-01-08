import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class bus_listPage extends Page<bus_listState, Map<String, dynamic>> {
  bus_listPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<bus_listState>(
                adapter: null,
                slots: <String, Dependent<bus_listState>>{
                }),
            middleware: <Middleware<bus_listState>>[
            ],);

}
