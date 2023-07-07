import 'package:dio/dio.dart';
import 'dart:async';
class ApiClient {
  FutureOr getData(String path) async {
    try {
       final response = await Dio(BaseOptions(baseUrl: "https://reqres.in"))
           .get("/api/users?page=2");
     /* final response = await Dio().post("/api/users?page=2",data: {
        },
      queryParameters: {
      }*/
       return response.data;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}