

import 'package:flutter/material.dart';
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
      theme: ThemeData.light(),
      
      darkTheme: ThemeData.dark(),
      initialRoute: RouteClass.getHomeRoute(),
      getPages: 
        RouteClass.getPages(),
    );
  }
}
