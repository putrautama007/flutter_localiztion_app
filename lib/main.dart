import 'package:core/external/route_path.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:core/external/locales_keys.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/home.dart';
import 'package:settings/settings.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
  ));
}

class AppModule extends MainModule{
  @override
  List<Bind> get binds => [
    Bind((_) => RoutePath()),
    Bind((_) => LocaleKeys())
  ];

  @override
  Widget get bootstrap => EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [Locale('en', 'US'), Locale('id', 'ID')],
      child: MyApp());

  @override
  List<ModularRouter> get routers => [
    ModularRouter(
      Modular.get<RoutePath>().home,
      module: HomeModule()
    ),
    ModularRouter(
        Modular.get<RoutePath>().settings,
        module: SettingsModule()
    ),
  ];

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Modular.get<LocaleKeys>().title.tr(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: Modular.get<RoutePath>().home,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      // home: MyHomePage(title: LocaleKeys.homeTitle.tr()),
    );
  }
}


