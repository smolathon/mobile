
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:smolathon_mobile/model/RequestMethods.dart';
import 'package:smolathon_mobile/model/api/Model.dart';

class RequestMaker{
  static bool IS_HTTPS = true;
  static Future<String> request({required String url, required HTTP_METHOD method, Object? body}) async {
    Uri uri = IS_HTTPS ? Uri.https(API_URL, url) : Uri.http(API_URL, url);
    switch (method){
      case HTTP_METHOD.POST:
        var response = await http.post(uri, body: json.encode(body), headers: {"content-type":"application/json"});
        print(response.body);
        print(response.statusCode);
        print(response.request?.headers.toString());
        return response.body;
      case HTTP_METHOD.GET:
        var response = await http.get(uri);
        print(response.body);
        print(response.statusCode);
        return response.body;
      case HTTP_METHOD.DELETE:
        var response = await http.delete(uri);
        return response.body;
    }


  }

  static Future<int> requestStatusCode({required String url, required HTTP_METHOD method, Object? body}) async {
    Uri uri = IS_HTTPS ? Uri.https(API_URL, url) : Uri.http(API_URL, url);
    switch (method){
      case HTTP_METHOD.POST:
        var response = await http.post(uri, body: json.encode(body), headers: {"content-type":"application/json"});
        print(response.body);
        print(response.statusCode);
        print(response.request?.headers.toString());
        return response.statusCode;
      case HTTP_METHOD.GET:
        var response = await http.get(uri);
        print(response.body);
        print(response.statusCode);
        return response.statusCode;
      case HTTP_METHOD.DELETE:
        var response = await http.delete(uri);
        return response.statusCode;
    }


  }

  static String API_URL = "a79e-176-59-47-205.ngrok.io";
}