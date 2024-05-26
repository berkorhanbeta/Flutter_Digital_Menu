import 'package:get/get.dart';
import 'package:qr_menu/view/category/category_screen.dart';
import 'package:qr_menu/view/home/home_screen.dart';
import 'package:qr_menu/view/product/detail_screen.dart';
import 'package:qr_menu/view/splash/splash_screen.dart';

class RouteHelper {
  static const String splash = '/';
  static const String home = '/home';
  static const String connection = '/connection';
  static const String details = '/details';
  static const String category = '/category';

  static getSplashRoute() => splash;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: home, page: () =>  HomeScreen()),
    GetPage(name: details, page: () => const ProductDetails(itemId: "",)),
    GetPage(name: category, page: () => CategoryScreen(mainCategoryId: "", mainCategoryTitle: "",))
  ];
}