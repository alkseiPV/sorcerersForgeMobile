import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sourcerers_forge/domains/blocs/authorization/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/cart/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/catalogs/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/category_products/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/favorite/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/orders/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/product_for_you/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/profile/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/registration/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/security/bloc.dart';
import 'package:sourcerers_forge/locator.dart';
import 'package:sourcerers_forge/presentation/authorization_screen/providers/authorization_provider.dart';
import 'package:sourcerers_forge/presentation/basket_screen/provider/basket_provider.dart';
import 'package:sourcerers_forge/presentation/catalog_screen/provider/catalog_provider.dart';
import 'package:sourcerers_forge/presentation/home_screen/provider/home_provider.dart';
import 'package:sourcerers_forge/presentation/profile_screen/provider/profile_provider.dart';
import 'package:sourcerers_forge/presentation/search_screen/provider/search_page_provider.dart';

class MultiProviderWidget extends StatelessWidget {
  final Widget child;
  const MultiProviderWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<AuthorizationBloc>(
          create: (context) => locator<AuthorizationBloc>(),
        ),
        BlocProvider<RegistrationBloc>(
          create: (context) => locator<RegistrationBloc>(),
        ),
        BlocProvider<CatalogBloc>(
          create: (context) => locator<CatalogBloc>(),
        ),
        BlocProvider<CategoryProductsBloc>(
          create: (context) => locator<CategoryProductsBloc>(),
        ),
        BlocProvider<ProductsForYouBloc>(
          create: (context) => locator<ProductsForYouBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => locator<CartBloc>(),
        ),
        BlocProvider<FavoriteBloc>(
          create: (context) => locator<FavoriteBloc>(),
        ),
        BlocProvider<SecurityBloc>(
          create: (context) => locator<SecurityBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => locator<ProfileBloc>(),
        ),
        BlocProvider<OrdersBloc>(
          create: (context) => locator<OrdersBloc>(),
        ),
        ChangeNotifierProvider(create: (context) => AuthorizationProvider()),
        ChangeNotifierProvider(create: (context) => BasketProvider()),
        ChangeNotifierProvider(create: (context) => CatalogProvider()),
        ChangeNotifierProvider(create: (context) => locator<HomeProvider>()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(
            create: (context) => locator<SearchPageProvider>()),
      ],
      child: child,
    );
  }
}
