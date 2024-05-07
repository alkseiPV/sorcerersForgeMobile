import 'package:auto_route/auto_route.dart';
import 'package:sourcerers_forge/presentation/catalog_screen/views/catalog_routes.dart';
import 'package:sourcerers_forge/presentation/profile_screen/views/profile_routes.dart';

import 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: App.page, initial: true),
        AutoRoute(page: NavigationPanel.page, children: [
          AutoRoute(page: HomeRoute.page),
          CatalogRoutes.routes,
          AutoRoute(page: BasketRoute.page),
          ProfileRoutes.routes
        ]),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: CreateOrderRoute.page),
        AutoRoute(page: CreateCompleteRoute.page),
        AutoRoute(page: SearchRoute.page)
      ];
}
