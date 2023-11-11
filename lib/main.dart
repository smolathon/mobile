import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'smolathon.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized(); // Инициализация Flutter-биндингов
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}
