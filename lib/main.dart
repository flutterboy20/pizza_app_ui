import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizza_app_ui/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    const MyApp(),
  );
}
