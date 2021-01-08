import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'presentation/pages/home/extension.dart';
import 'presentation/widgets/widgets.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: 'Patagonian Test',
        logWriterCallback: (text, {isError}) => print(text),
        defaultTransition: Transition.cupertino,
        initialRoute: RouteName.main,
        transitionDuration: const Duration(milliseconds: 300),
        enableLog: true,
        builder: (_, child) => Scaffold(
          key: SnackBarExtension.scaffoldKey,
          body: Builder(
            builder: (context) => child,
          ),
        ),
        debugShowCheckedModeBanner: false,
        locale: const Locale('es', 'AR'),
        getPages: CustomRouter.routes,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: CustomTheme.theme,
        supportedLocales: [
          const Locale('es', 'AR'),
        ],
      ),
    );
  }
}
