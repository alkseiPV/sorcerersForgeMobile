import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class CatalogWrapperScreen extends StatelessWidget implements AutoRouteWrapper {
  const CatalogWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context).popUntilRoot();
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

abstract class CatalogRoutes {
  static final routes = AutoRoute(page: CatalogWrapperRoute.page, children: [
    AutoRoute(page: CatalogRoute.page, initial: true),
    AutoRoute(page: SubCatalogRoute.page)
  ]);
}
