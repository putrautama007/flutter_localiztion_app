import 'package:core/external/route_path.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class HomeRouter {
  goToSettings();
}

class HomeRouterImpl extends HomeRouter {
  @override
  goToSettings() {
    Modular.to.pushNamed(Modular.get<RoutePath>().settings);
  }
}
