import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio ;
  static void init()
  {
    dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true ,
      baseUrl: 'http://mark.bslmeiyu.com/api/'
    )) ;
  }

  static Future <Response> getData(
  {
  required String path
}
      )
  async {
    return await dio.get(path) ;
  }
}