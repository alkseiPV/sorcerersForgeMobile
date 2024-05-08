import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sourcerers_forge/locator.dart';
import 'package:sourcerers_forge/multi_provider.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/routes/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(const SourcerersForgeApp());
}

class SourcerersForgeApp extends StatelessWidget {
  const SourcerersForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        child: MultiProviderWidget(
          child: OverlaySupport.global(
            child: MaterialApp.router(
              routerDelegate: AutoRouterDelegate(appRouter),
              routeInformationParser: appRouter.defaultRouteParser(),
              theme: ThemeData(
                  colorScheme:
                      const ColorScheme.dark(background: AppColors.background),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      backgroundColor: AppColors.background),
                  appBarTheme: const AppBarTheme(color: AppColors.background),
                  scaffoldBackgroundColor: AppColors.background),
            ),
          ),
        ));
  }
}
