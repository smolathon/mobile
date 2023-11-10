import 'package:flutter/material.dart';
import 'package:smolathon_mobile/router/router.dart';
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeData _themeData;
  late MaterialColor _primarySwatch;

  @override
  void initState() {
    super.initState();
    _themeData = ThemeData.light();
    _primarySwatch = Colors.blue;
  }

  
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: _themeData,
    );
  }
}
