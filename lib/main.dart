import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova/features/chat/view/chatscreen.dart';
import 'package:nova/routes/custom_pages.dart';
import 'package:nova/routes/custom_routes.dart';
import 'package:nova/routes/initial_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: CustomPages.pages,
      initialBinding: InitialBinding(),
      initialRoute: CustomRoutes.chat,
      title: 'N O V A',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
