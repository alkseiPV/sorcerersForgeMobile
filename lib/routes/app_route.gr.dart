// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i26;
import 'package:sourcerers_forge/models/order_model.dart' as _i27;
import 'package:sourcerers_forge/models/product_model.dart' as _i28;
import 'package:sourcerers_forge/presentation/app.dart' as _i2;
import 'package:sourcerers_forge/presentation/authorization_screen/view/confirm_code_page.dart'
    as _i6;
import 'package:sourcerers_forge/presentation/authorization_screen/view/login_page.dart'
    as _i10;
import 'package:sourcerers_forge/presentation/authorization_screen/view/registration_page.dart'
    as _i18;
import 'package:sourcerers_forge/presentation/authorization_screen/view/reset_pass_page.dart'
    as _i19;
import 'package:sourcerers_forge/presentation/basket_screen/views/basket_page.dart'
    as _i3;
import 'package:sourcerers_forge/presentation/basket_screen/views/create_complete_page.dart'
    as _i7;
import 'package:sourcerers_forge/presentation/basket_screen/views/create_order_page.dart'
    as _i8;
import 'package:sourcerers_forge/presentation/catalog_screen/views/catalog_page.dart'
    as _i4;
import 'package:sourcerers_forge/presentation/catalog_screen/views/catalog_routes.dart'
    as _i5;
import 'package:sourcerers_forge/presentation/catalog_screen/views/subcatalog_page.dart'
    as _i23;
import 'package:sourcerers_forge/presentation/home_screen/views/home_page.dart'
    as _i9;
import 'package:sourcerers_forge/presentation/navigation_panel.dart' as _i13;
import 'package:sourcerers_forge/presentation/profile_screen/views/about_us_page.dart'
    as _i1;
import 'package:sourcerers_forge/presentation/profile_screen/views/my_data_page.dart'
    as _i11;
import 'package:sourcerers_forge/presentation/profile_screen/views/my_orders_page.dart'
    as _i12;
import 'package:sourcerers_forge/presentation/profile_screen/views/order_info_page.dart'
    as _i14;
import 'package:sourcerers_forge/presentation/profile_screen/views/personal_order_page.dart'
    as _i15;
import 'package:sourcerers_forge/presentation/profile_screen/views/profile_page.dart'
    as _i16;
import 'package:sourcerers_forge/presentation/profile_screen/views/profile_routes.dart'
    as _i17;
import 'package:sourcerers_forge/presentation/profile_screen/views/security_page.dart'
    as _i21;
import 'package:sourcerers_forge/presentation/profile_screen/views/send_comment_page.dart'
    as _i22;
import 'package:sourcerers_forge/presentation/profile_screen/views/teaching_page.dart'
    as _i24;
import 'package:sourcerers_forge/presentation/search_screen/views/search_page.dart'
    as _i20;

abstract class $AppRouter extends _i25.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    AboutUsRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsPage(),
      );
    },
    App.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.App(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BasketPage(),
      );
    },
    CatalogRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CatalogPage(),
      );
    },
    CatalogWrapperRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.WrappedRoute(child: const _i5.CatalogWrapperScreen()),
      );
    },
    ConfirmCodeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ConfirmCodePage(),
      );
    },
    CreateCompleteRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CreateCompletePage(),
      );
    },
    CreateOrderRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CreateOrderPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoginPage(),
      );
    },
    MyDataRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MyDataPage(),
      );
    },
    MyOrdersRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.MyOrdersPage(),
      );
    },
    NavigationPanel.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.NavigationPanel(),
      );
    },
    OrderInfoRoute.name: (routeData) {
      final args = routeData.argsAs<OrderInfoRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.OrderInfoPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    PersonalOrderRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PersonalOrderPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ProfilePage(),
      );
    },
    ProfileWrapperRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.ProfileWrapperScreen(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.RegistrationPage(),
      );
    },
    ResetPassRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ResetPassPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SearchPage(),
      );
    },
    SecurityRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SecurityPage(),
      );
    },
    SendCommentRoute.name: (routeData) {
      final args = routeData.argsAs<SendCommentRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.SendCommentPage(
          key: args.key,
          model: args.model,
        ),
      );
    },
    SubCatalogRoute.name: (routeData) {
      final args = routeData.argsAs<SubCatalogRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.SubCatalogPage(
          key: args.key,
          catalogName: args.catalogName,
          idCategory: args.idCategory,
        ),
      );
    },
    TeachingRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.TeachingPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsPage]
class AboutUsRoute extends _i25.PageRouteInfo<void> {
  const AboutUsRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i2.App]
class App extends _i25.PageRouteInfo<void> {
  const App({List<_i25.PageRouteInfo>? children})
      : super(
          App.name,
          initialChildren: children,
        );

  static const String name = 'App';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BasketPage]
class BasketRoute extends _i25.PageRouteInfo<void> {
  const BasketRoute({List<_i25.PageRouteInfo>? children})
      : super(
          BasketRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CatalogPage]
class CatalogRoute extends _i25.PageRouteInfo<void> {
  const CatalogRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CatalogRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatalogRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CatalogWrapperScreen]
class CatalogWrapperRoute extends _i25.PageRouteInfo<void> {
  const CatalogWrapperRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CatalogWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatalogWrapperRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ConfirmCodePage]
class ConfirmCodeRoute extends _i25.PageRouteInfo<void> {
  const ConfirmCodeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ConfirmCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmCodeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CreateCompletePage]
class CreateCompleteRoute extends _i25.PageRouteInfo<void> {
  const CreateCompleteRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CreateCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateCompleteRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CreateOrderPage]
class CreateOrderRoute extends _i25.PageRouteInfo<void> {
  const CreateOrderRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CreateOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateOrderRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i25.PageRouteInfo<void> {
  const HomeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LoginPage]
class LoginRoute extends _i25.PageRouteInfo<void> {
  const LoginRoute({List<_i25.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MyDataPage]
class MyDataRoute extends _i25.PageRouteInfo<void> {
  const MyDataRoute({List<_i25.PageRouteInfo>? children})
      : super(
          MyDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyDataRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MyOrdersPage]
class MyOrdersRoute extends _i25.PageRouteInfo<void> {
  const MyOrdersRoute({List<_i25.PageRouteInfo>? children})
      : super(
          MyOrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyOrdersRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i13.NavigationPanel]
class NavigationPanel extends _i25.PageRouteInfo<void> {
  const NavigationPanel({List<_i25.PageRouteInfo>? children})
      : super(
          NavigationPanel.name,
          initialChildren: children,
        );

  static const String name = 'NavigationPanel';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i14.OrderInfoPage]
class OrderInfoRoute extends _i25.PageRouteInfo<OrderInfoRouteArgs> {
  OrderInfoRoute({
    _i26.Key? key,
    required _i27.OrderModel order,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          OrderInfoRoute.name,
          args: OrderInfoRouteArgs(
            key: key,
            order: order,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderInfoRoute';

  static const _i25.PageInfo<OrderInfoRouteArgs> page =
      _i25.PageInfo<OrderInfoRouteArgs>(name);
}

class OrderInfoRouteArgs {
  const OrderInfoRouteArgs({
    this.key,
    required this.order,
  });

  final _i26.Key? key;

  final _i27.OrderModel order;

  @override
  String toString() {
    return 'OrderInfoRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i15.PersonalOrderPage]
class PersonalOrderRoute extends _i25.PageRouteInfo<void> {
  const PersonalOrderRoute({List<_i25.PageRouteInfo>? children})
      : super(
          PersonalOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalOrderRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ProfilePage]
class ProfileRoute extends _i25.PageRouteInfo<void> {
  const ProfileRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ProfileWrapperScreen]
class ProfileWrapperRoute extends _i25.PageRouteInfo<void> {
  const ProfileWrapperRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ProfileWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileWrapperRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i18.RegistrationPage]
class RegistrationRoute extends _i25.PageRouteInfo<void> {
  const RegistrationRoute({List<_i25.PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ResetPassPage]
class ResetPassRoute extends _i25.PageRouteInfo<void> {
  const ResetPassRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ResetPassRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPassRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i20.SearchPage]
class SearchRoute extends _i25.PageRouteInfo<void> {
  const SearchRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SecurityPage]
class SecurityRoute extends _i25.PageRouteInfo<void> {
  const SecurityRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SecurityRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecurityRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SendCommentPage]
class SendCommentRoute extends _i25.PageRouteInfo<SendCommentRouteArgs> {
  SendCommentRoute({
    _i26.Key? key,
    required _i28.ProductModel model,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          SendCommentRoute.name,
          args: SendCommentRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'SendCommentRoute';

  static const _i25.PageInfo<SendCommentRouteArgs> page =
      _i25.PageInfo<SendCommentRouteArgs>(name);
}

class SendCommentRouteArgs {
  const SendCommentRouteArgs({
    this.key,
    required this.model,
  });

  final _i26.Key? key;

  final _i28.ProductModel model;

  @override
  String toString() {
    return 'SendCommentRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i23.SubCatalogPage]
class SubCatalogRoute extends _i25.PageRouteInfo<SubCatalogRouteArgs> {
  SubCatalogRoute({
    _i26.Key? key,
    required String catalogName,
    required int idCategory,
    List<_i25.PageRouteInfo>? children,
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

  static const _i25.PageInfo<SubCatalogRouteArgs> page =
      _i25.PageInfo<SubCatalogRouteArgs>(name);
}

class SubCatalogRouteArgs {
  const SubCatalogRouteArgs({
    this.key,
    required this.catalogName,
    required this.idCategory,
  });

  final _i26.Key? key;

  final String catalogName;

  final int idCategory;

  @override
  String toString() {
    return 'SubCatalogRouteArgs{key: $key, catalogName: $catalogName, idCategory: $idCategory}';
  }
}

/// generated route for
/// [_i24.TeachingPage]
class TeachingRoute extends _i25.PageRouteInfo<void> {
  const TeachingRoute({List<_i25.PageRouteInfo>? children})
      : super(
          TeachingRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeachingRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}
