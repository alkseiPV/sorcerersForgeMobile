import 'package:dio/dio.dart';
import 'package:sourcerers_forge/data/secure_storage.dart';

class DioService {
  final Dio _dio;
  final SecureStorage secureStorage;

  DioService({BaseOptions? options, required this.secureStorage})
      : _dio = Dio(options ??
            BaseOptions(
                baseUrl: "http://95.165.64.208:6565",
                connectTimeout: const Duration(milliseconds: 5000),
                receiveTimeout: const Duration(milliseconds: 10000),
                validateStatus: (status) {
                  return status! <= 500; // Принимаем все статусы
                }));

  Future<String?> getToken() async {
    String? ans = await secureStorage.readSecureData('token');
    return ans;
  }

  Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? headers}) async {
    try {
      String? token = await getToken();
      Map<String, dynamic> combinedHeaders = {
        if (token != null) 'Authorization': 'Bearer $token',
        ...?headers
      };
      final response =
          await _dio.get(endpoint, options: Options(headers: combinedHeaders));
      print(response);
      return response;
    } catch (dioError) {
      // Обработка ошибок Dio
      rethrow;
    }
  }

  Future<Response> postRequest(String endpoint,
      {Map<String, dynamic>? headers, dynamic data}) async {
    //try {
    String? token = await getToken();
    Map<String, dynamic> combinedHeaders = {
      if (token != null) 'Authorization': 'Bearer $token',
      ...?headers
    };

    print("Sending request to $endpoint");
    print("Method: POST");
    print("Headers: $combinedHeaders");
    print("Body: $data");

    final response = await _dio.post(endpoint,
        data: data, options: Options(headers: combinedHeaders));
    print(response);
    return response;
    /*  } catch (dioError) {
      // Обработка ошибок Dio
      throw dioError;
    } */
  }

  Future<Response> deleteRequest(String endpoint,
      {Map<String, dynamic>? headers, dynamic data}) async {
    try {
      String? token = await getToken();
      Map<String, dynamic> combinedHeaders = {
        if (token != null) 'Authorization': 'Bearer $token',
        ...?headers
      };
      final response = await _dio.delete(endpoint,
          data: data, options: Options(headers: combinedHeaders));
      print(response);
      return response;
    } catch (dioError) {
      // Обработка ошибок Dio
      rethrow;
    }
  }
}
