import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './data/data.dart';
import './pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: globalController.theme.value,
      home: const Homepage(),
    );
  }
}
