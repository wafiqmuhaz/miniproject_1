import 'package:go_router/go_router.dart';
import 'package:miniproject_1/model/product_model.dart';
import 'package:miniproject_1/pages/cart_page/cart_screen.dart';
import 'package:miniproject_1/pages/home_page/home_page.dart';
import 'package:miniproject_1/pages/product_page/product_detail_page.dart';
import 'package:miniproject_1/pages/user_page/user_page.dart';
import 'package:miniproject_1/routes/routes_name.dart';

class AppRouter {
  static final AppRouter shared = AppRouter._internal();
  factory AppRouter() {
    return shared;
  }
  AppRouter._internal();

  final router = GoRouter(routes: [
    GoRoute(path: RouteNames.home, builder: (context, state) => HomePage()),
    GoRoute(
        path: RouteNames.detailProduct,
        builder: (context, state) {
          final product = ProductModel.fromMap(state.uri.queryParameters);
          return ProductDetailPage(product: product);
        }),
    GoRoute(
        path: RouteNames.cartScreen,
        builder: (context, state) => const CartPage()),
     GoRoute(
        path: RouteNames.userPage,
        builder: (context, state) => const UserPage()),
  ]);
}
