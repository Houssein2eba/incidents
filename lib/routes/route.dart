
import 'package:get/get.dart';
import 'package:incidents/middleware/auth_middleware.dart';
import 'package:incidents/main.dart';
import 'package:incidents/view/home_page.dart';
import 'package:incidents/view/auth/login_form.dart';


class RouteClass{
  static const String home = '/';
  static const String login = '/login';


  static String getHomeRoute() => home;
  static String getLoginRoute() => login; 


  static List<GetPage> getPages() {
    return [
      GetPage(name: home, page: () => HomePage(),middlewares: [SanctumAuthMiddleware()]),
      GetPage(name: login, page: () => Login(),middlewares: [SanctumAuthMiddleware()]),

    ];
  }
}