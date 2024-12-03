import 'package:crypto_wise/config/router/app_router.dart';
import 'package:crypto_wise/config/theme/app_theme.dart';
import 'package:crypto_wise/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async{

  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    EasyLoading.instance
      .. maskType = EasyLoadingMaskType.custom
      ..maskColor = Colors.white;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.name,
      theme: AppTheme.getTheme(),
      getPages: appRouter,
      builder: EasyLoading.init(),
    );
  }
}