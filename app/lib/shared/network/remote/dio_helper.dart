import 'package:dio/dio.dart';

// ToDo: Class_DioHelper........................................................
class DioHelper {
  static Dio? dio;

  ///~> Dio_init----------------------------------------------------------------
  static Dio? init() => dio = Dio(BaseOptions(
      // ?stock=Communications-2
      baseUrl: 'https://20mccck65d.execute-api.ap-northeast-1.amazonaws.com/',
      receiveDataWhenStatusError: true));

  ///~> Dio_getData-------------------------------------------------------------
  static Future<Response> getData(
          {required String path,
          Map<String, dynamic>? queryParameters = const {}}) async =>
      await dio!.get(path, queryParameters: queryParameters);
}
