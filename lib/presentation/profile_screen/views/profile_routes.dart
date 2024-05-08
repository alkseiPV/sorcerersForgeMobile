import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class ProfileWrapperScreen extends StatefulWidget {
  const ProfileWrapperScreen({super.key});

  @override
  State<ProfileWrapperScreen> createState() => _ProfileWrapperScreenState();
}

class _ProfileWrapperScreenState extends State<ProfileWrapperScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AutoRouter.of(context).popUntilRoot();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
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
