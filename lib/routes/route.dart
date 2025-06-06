
import 'package:get/get.dart';

import 'package:incidents/core/middleware/logged_in_middleware.dart';
import 'package:incidents/view/screen/auth/register_form.dart';
import 'package:incidents/view/home_page.dart';
import 'package:incidents/view/screen/auth/login_form.dart';
import 'package:incidents/view/screen/on_boarding.dart';


class RouteClass{
  static const String home = '/home';
  static const String login = '/login';
  static const String register='/register';
  static const String onBoarding='/';





  static List<GetPage> getPages() {
    return [
      GetPage(name: home, page: () => HomePage()),
      GetPage(name: register, page: () => RegisterForm()),
      GetPage(name: login, page: () => LoginForm()),
      GetPage(name: onBoarding, page: () => OnBoarding(), middlewares: [LoggedInMiddleware()]),
    ];
  }
}