

import 'package:flutter/material.dart';
import 'package:incidents/core/localization/translations.dart';
import 'package:incidents/routes/route.dart';
import 'package:get/get.dart';
import 'package:incidents/service/permissions_service.dart';
import 'package:incidents/service/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize and register the StorageService
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => PermissionsService().askStoragePermission());
  await Get.putAsync(() => PermissionsService().askcameraPermission());
   
  
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo Getx',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
                    primary: Colors.green, // Main blue color
                   secondary: Colors.white, // Secondary blue
          
        ),
         appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
          
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
        ),
      ),
      
      
    
      defaultTransition: Transition.leftToRight,
      translations: AllTranslations(),
      locale: Get.deviceLocale,
      getPages: 
        RouteClass.getPages(),
    );
  }
}
