import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class Login_passwordPage extends Page<Login_passwordState, Map<String, dynamic>> {
  Login_passwordPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<Login_passwordState>(
                adapter: null,
                slots: <String, Dependent<Login_passwordState>>{
                }),
            middleware: <Middleware<Login_passwordState>>[
            ],);

}
