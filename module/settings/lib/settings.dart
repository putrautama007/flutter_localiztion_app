import 'package:core/external/locales_keys.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:settings/presentation/pages/change_language_screen.dart';

class SettingsModule extends ChildModule{
  @override
  List<Bind> get binds => [
    Bind((_) => LocaleKeys()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/",child: (_,__) => ChangeLanguageScreen()),
  ];

}