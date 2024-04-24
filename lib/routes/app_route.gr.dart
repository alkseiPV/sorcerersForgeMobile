// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:sourcerers_forge/presentation/app.dart' as _i2;
import 'package:sourcerers_forge/presentation/authorization_screen/view/login_page.dart'
    as _i9;
import 'package:sourcerers_forge/presentation/authorization_screen/view/registration_page.dart'
    as _i15;
import 'package:sourcerers_forge/presentation/basket_screen/views/basket_page.dart'
    as _i3;
import 'package:sourcerers_forge/presentation/basket_screen/views/create_complete_page.dart'
    as _i6;
import 'package:sourcerers_forge/presentation/basket_screen/views/create_order_page.dart'
    as _i7;
import 'package:sourcerers_forge/presentation/catalog_screen/views/catalog_page.dart'
    as _i4;
import 'package:sourcerers_forge/presentation/catalog_screen/views/catalog_routes.dart'
    as _i5;
import 'package:sourcerers_forge/presentation/catalog_screen/views/subcatalog_page.dart'
    as _i17;
import 'package:sourcerers_forge/presentation/home_screen/views/home_page.dart'
    as _i8;
import 'package:sourcerers_forge/presentation/navigation_panel.dart' as _i11;
import 'package:sourcerers_forge/presentation/profile_screen/views/about_us_page.dart'
    as _i1;
import 'package:sourcerers_forge/presentation/profile_screen/views/my_data_page.dart'
    as _i10;
import 'package:sourcerers_forge/presentation/profile_screen/views/personal_order_page.dart'
    as _i12;
import 'package:sourcerers_forge/presentation/profile_screen/views/profile_page.dart'
    as _i13;
import 'package:sourcerers_forge/presentation/profile_screen/views/profile_routes.dart'
    as _i14;
import 'package:sourcerers_forge/presentation/profile_screen/views/security_page.dart'
    as _i16;
import 'package:sourcerers_forge/presentation/profile_screen/views/teaching_page.dart'
    as _i18;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AboutUsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsPage(),
      );
    },
    App.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.App(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BasketPage(),
      );
    },
    CatalogRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CatalogPage(),
      );
    },
    CatalogWrapperRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i5.CatalogWrapperScreen()),
      );
    },
    CreateCompleteRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CreateCompletePage(),
      );
    },
    CreateOrderRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CreateOrderPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginPage(),
      );
    },
    MyDataRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MyDataPage(),
      );
    },
    NavigationPanel.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.NavigationPanel(),
      );
    },
    PersonalOrderRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PersonalOrderPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ProfilePage(),
      );
    },
    ProfileWrapperRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i14.ProfileWrapperScreen()),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.RegistrationPage(),
      );
    },
    SecurityRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SecurityPage(),
      );
    },
    SubCatalogRoute.name: (routeData) {
      final args = routeData.argsAs<SubCatalogRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.SubCatalogPage(
          key: args.key,
          catalogName: args.catalogName,
          idCategory: args.idCategory,
        ),
      );
    },
    TeachingRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.TeachingPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsPage]
class AboutUsRoute extends _i19.PageRouteInfo<void> {
  const AboutUsRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.App]
class App extends _i19.PageRouteInfo<void> {
  const App({List<_i19.PageRouteInfo>? children})
      : super(
          App.name,
          initialChildren: children,
        );

  static const String name = 'App';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BasketPage]
class BasketRoute extends _i19.PageRouteInfo<void> {
  const BasketRoute({List<_i19.PageRouteInfo>? children})
      : super(
          BasketRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CatalogPage]
class CatalogRoute extends _i19.PageRouteInfo<void> {
  const CatalogRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CatalogRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatalogRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CatalogWrapperScreen]
class CatalogWrapperRoute extends _i19.PageRouteInfo<void> {
  const CatalogWrapperRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CatalogWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatalogWrapperRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CreateCompletePage]
class CreateCompleteRoute extends _i19.PageRouteInfo<void> {
  const CreateCompleteRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CreateCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateCompleteRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CreateOrderPage]
class CreateOrderRoute extends _i19.PageRouteInfo<void> {
  const CreateOrderRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CreateOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateOrderRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MyDataPage]
class MyDataRoute extends _i19.PageRouteInfo<void> {
  const MyDataRoute({List<_i19.PageRouteInfo>? children})
      : super(
          MyDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyDataRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.NavigationPanel]
class NavigationPanel extends _i19.PageRouteInfo<void> {
  const NavigationPanel({List<_i19.PageRouteInfo>? children})
      : super(
          NavigationPanel.name,
          initialChildren: children,
        );

  static const String name = 'NavigationPanel';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PersonalOrderPage]
class PersonalOrderRoute extends _i19.PageRouteInfo<void> {
  const PersonalOrderRoute({List<_i19.PageRouteInfo>? children})
      : super(
          PersonalOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalOrderRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ProfileWrapperScreen]
class ProfileWrapperRoute extends _i19.PageRouteInfo<void> {
  const ProfileWrapperRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileWrapperRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.RegistrationPage]
class RegistrationRoute extends _i19.PageRouteInfo<void> {
  const RegistrationRoute({List<_i19.PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SecurityPage]
class SecurityRoute extends _i19.PageRouteInfo<void> {
  const SecurityRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SecurityRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecurityRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SubCatalogPage]
class SubCatalogRoute extends _i19.PageRouteInfo<SubCatalogRouteArgs> {
  SubCatalogRoute({
    _i20.Key? key,
    required String catalogName,
    required int idCategory,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          SubCatalogRoute.name,
          args: SubCatalogRouteArgs(
            key: key,
            catalogName: catalogName,
            idCategory: idCategory,
          ),
          initialChildren: children,
        );

  static const String name = 'SubCatalogRoute';

  static const _i19.PageInfo<SubCatalogRouteArgs> page =
      _i19.PageInfo<SubCatalogRouteArgs>(name);
}

class SubCatalogRouteArgs {
  const SubCatalogRouteArgs({
    this.key,
    required this.catalogName,
    required this.idCategory,
  });

  final _i20.Key? key;

  final String catalogName;

  final int idCategory;

  @override
  String toString() {
    return 'SubCatalogRouteArgs{key: $key, catalogName: $catalogName, idCategory: $idCategory}';
  }
}

/// generated route for
/// [_i18.TeachingPage]
class TeachingRoute extends _i19.PageRouteInfo<void> {
  const TeachingRoute({List<_i19.PageRouteInfo>? children})
      : super(
          TeachingRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeachingRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}
