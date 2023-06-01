import 'package:dio/dio.dart';
//https://20mccck65d.execute-api.ap-northeast-1.amazonaws.com/?stock=ABUK-1

//ToDo: Class_DioHelper.........................................................
class DioHelper {
  static Dio? dio;
//!~> Dio_init >===============================================================<
  static Dio? init() => dio = Dio(BaseOptions(
      // ?stock=Communications-2
      //https://20mccck65d.execute-api.ap-northeast-1.amazonaws.com/?stock=ABUK-0
//https://scrap-29ek.onrender.com/stock/abuk/7
//https://20mccck65d.execute-api.ap-northeast-1.amazonaws.com/?stock=ABUK-1
      baseUrl:
          'https://20mccck65d.execute-api.ap-northeast-1.amazonaws.com/', //'https://',
      /*Details */ /*All chart */
      // "https://ou8m3oozn4.execute-api.ap-northeast-1.amazonaws.com/default/",/*Sector */
      // "https://scrap-29ek.onrender.com/stock/",
      /*chart */
      receiveDataWhenStatusError: true));
//!~> Dio_getData >============================================================<
  static Future<Response> getData(
          {required String path,
          Map<String, dynamic>? queryParameters = const {}}) async =>
      await dio!.get(path, queryParameters: queryParameters);
}
