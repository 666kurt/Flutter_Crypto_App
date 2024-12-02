import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/app/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CryptoListRoute.page, initial: true),
        AutoRoute(page: CryptoDetailsRoute.page),
      ];
}
