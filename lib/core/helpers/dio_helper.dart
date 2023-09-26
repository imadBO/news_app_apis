import 'package:dio/dio.dart';
import 'package:news_app_apis/core/constants.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: kBaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getNews(
    Map<String, dynamic> query,
    String endPoint,
  ) async {
    return await dio!.get(endPoint, queryParameters: query);
  }
}
