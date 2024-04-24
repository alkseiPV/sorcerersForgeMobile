import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class ProfileWrapperScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProfileWrapperScreen({super.key});

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

abstract class ProfileRoutes {
  static final routes = AutoRoute(page: ProfileWrapperRoute.page, children: [
    AutoRoute(page: ProfileRoute.page, initial: true),
    AutoRoute(page: MyDataRoute.page),
    AutoRoute(page: PersonalOrderRoute.page),
    AutoRoute(page: TeachingRoute.page),
    AutoRoute(page: SecurityRoute.page),
    AutoRoute(page: AboutUsRoute.page)
  ]);
}
