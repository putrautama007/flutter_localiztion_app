import 'package:core/external/locales_keys.dart';
import 'package:core/external/route_path.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/pages/home_screen.dart';

class HomeModule extends ChildModule{
  @override
  List<Bind> get binds => [
    Bind((_) => LocaleKeys()),
    Bind((_) => RoutePath()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/",child: (_,__) => HomeScreen()),
  ];
}