import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../ModelClass/UserDetails.dart';
import 'ApiClient.dart';

class UserApiCall {
  Future<List<UserDetails>> getdata()async{
    try{
    final response = await ApiClient().getData("/api/users?page=2");
    final List data = response["data"];
    return data.map((e) => UserDetails.fromJson(e)).toList();
    }  catch( e){
          throw Exception(e);
      }
  }
}