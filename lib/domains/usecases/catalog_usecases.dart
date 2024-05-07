import 'package:sourcerers_forge/data/dio_service.dart';
import 'package:sourcerers_forge/data/secure_storage.dart';
import 'package:sourcerers_forge/models/category_model.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/models/review_model.dart';

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

  loadReviews(int idProduct) async {
    List<ReviewModel> reviews = [];
    try {
      final response = await dioService.getRequest('/getReview?id=$idProduct');

      if (response.statusCode == 200) {
        reviews = (response.data['reviews'] as List)
            .map((e) => ReviewModel.fromJson(e))
            .toList();
      }
      return reviews;
    } catch (e) {
      return reviews;
    }
  }

  changefavorite(int idProduct, bool added) async {
    if (added) {
      final response = await dioService.postRequest('/favorite/addToFavorite',
          data: {'product_id': idProduct});
    } else {
      final response = await dioService
          .deleteRequest('/favorite/deleteFavorite?productId=$idProduct');
    }
  }

  addAllFavorite() async {
    final response = await dioService.getRequest('/favorite/favorite');

    List<int> ids = [];
    if (response.statusCode == 200) {
      ids = (response.data['favorite'] as List).map((e) {
        return int.parse(e['product_id'].toString());
      }).toList();

      return ids;
    }
  }
}
