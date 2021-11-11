import 'package:flutter/material.dart' hide Router;

import 'kitaro.dart';

void main() {
  runApp(KitaroApp());
}


class KitaroApp extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  KitaroApp({
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final _appRouter = AppRouter();

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      restorationScopeId: 'Kitaro-app',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: FontFamily.lato,
        splashColor: Colors.white.withOpacity(0.5),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: FontFamily.lato,
        splashColor: Colors.white.withOpacity(0.5),
      ),
      onGenerateTitle: (context) => 'Kitaro',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, router) {
        final window = WidgetsBinding.instance!.window;
        final media = MediaQueryData.fromWindow(window);
        return Stack(
          children: [
            Positioned.fill(child: router!),
            // if (isInDebugMode)
              Positioned(
                left: 8.0,
                bottom: 8.0,
                child: DefaultTextStyle(
                  child: Text(
                    '${media.size.width}×${media.size.height}',
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: FontFamily.lato,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
