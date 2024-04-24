import 'package:sourcerers_forge/data/dio_service.dart';
import 'package:sourcerers_forge/data/secure_storage.dart';
import 'package:sourcerers_forge/models/category_model.dart';
import 'package:sourcerers_forge/models/product_model.dart';

class CatalogUseCases {
  DioService dioService;
  SecureStorage secureStorage;
  CatalogUseCases({required this.dioService, required this.secureStorage});

  loadAllCategories() async {
    final response = await dioService.getRequest('/categories');

    List<CategoryModel> categories = (response.data['categories'] as List)
        .map((categoryJson) => CategoryModel.fromJson(categoryJson))
        .toList();

    return categories;
  }

  loadAllProducts() async {
    final response = await dioService.getRequest('/products?pageSize=30');

    List<ProductModel> products = (response.data['products'] as List)
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();

    return products;
  }

  loadCategoryProducts(int idCategory) async {
    print(idCategory);
    final response = await dioService.getRequest(
      '/productsCategory?id=$idCategory',
    );

    print(response.data);

    List<ProductModel> products = (response.data['products'] as List)
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();

    return products;
  }
}
