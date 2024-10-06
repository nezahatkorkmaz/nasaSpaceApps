import 'package:deneme/ui/main_view/view_main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

void main() {
  Gemini.init(apiKey: 'AIzaSyDiZqcYF-w-OMFDOwkJhGRHqrZG_frey7I');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: ViewMain(),
    );
  }
}
