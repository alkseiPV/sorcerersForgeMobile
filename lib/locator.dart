import 'package:get_it/get_it.dart';
import 'package:sourcerers_forge/data/dio_service.dart';
import 'package:sourcerers_forge/data/secure_storage.dart';
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
import 'package:sourcerers_forge/domains/usecases/authorization_usecase.dart';
import 'package:sourcerers_forge/domains/usecases/cart_usecases.dart';
import 'package:sourcerers_forge/domains/usecases/catalog_usecases.dart';
import 'package:sourcerers_forge/domains/usecases/profile_usecases.dart';
import 'package:sourcerers_forge/domains/usecases/registration_usecase.dart';
import 'package:sourcerers_forge/presentation/home_screen/provider/home_provider.dart';
import 'package:sourcerers_forge/presentation/search_screen/provider/search_page_provider.dart';

GetIt locator = GetIt.I;

setupLocator() async {
  locator.registerFactory(() => DioService(secureStorage: locator()));
  locator.registerFactory(() => SecureStorage());
  //BloC
  locator.registerFactory<RegistrationBloc>(() => RegistrationBloc(locator()));
  locator
      .registerFactory<AuthorizationBloc>(() => AuthorizationBloc(locator()));
  locator.registerFactory<CatalogBloc>(() => CatalogBloc(locator()));
  locator.registerFactory<CategoryProductsBloc>(
      () => CategoryProductsBloc(locator()));
  locator
      .registerFactory<ProductsForYouBloc>(() => ProductsForYouBloc(locator()));
  locator.registerFactory<CartBloc>(() => CartBloc(locator()));
  locator.registerFactory<FavoriteBloc>(() => FavoriteBloc(locator()));
  locator.registerFactory<SecurityBloc>(() => SecurityBloc(locator()));
  locator.registerFactory<ProfileBloc>(() => ProfileBloc(locator()));
  locator.registerFactory<OrdersBloc>(() => OrdersBloc(locator()));

  //UseCase
  locator
      .registerLazySingleton(() => RegistrationUseCase(dioService: locator()));
  locator.registerLazySingleton(() =>
      AuthorizationUseCase(dioService: locator(), secureStorage: locator()));
  locator.registerLazySingleton(
      () => CatalogUseCases(dioService: locator(), secureStorage: locator()));

  locator.registerLazySingleton(() => CartUsecases(dioService: locator()));
  locator.registerLazySingleton(
      () => ProfileUseCases(dioService: locator(), secureStorage: locator()));

  //Providers
  locator.registerLazySingleton(() => HomeProvider());
  locator.registerLazySingleton(() => SearchPageProvider());
}
