
import 'package:get/get.dart';
import 'package:incidents/bindings/app_bindings.dart';
import 'package:incidents/controller/home_controller.dart';
import 'package:incidents/middleware/auth_middleware.dart';
import 'package:incidents/main.dart';
import 'package:incidents/view/auth/register_form.dart';
import 'package:incidents/view/home_page.dart';
import 'package:incidents/view/auth/login_form.dart';


class RouteClass{
  static const String home = '/';
  static const String login = '/login';
  static const String reguster='/reguster';


  static String getHomeRoute() => home;
  static String getLoginRoute() => login; 
  static String getRegusterRoute() => reguster;


  static List<GetPage> getPages() {
    return [
      GetPage(name: home, page: () => HomePage(), binding:AppBindings(),middlewares: [
        SanctumAuthMiddleware()
      ]),
      GetPage(name: reguster, page: () => RegisterForm()),
      GetPage(name: login, page: () => LoginForm(),binding: AppBindings()),

    ];
  }
}