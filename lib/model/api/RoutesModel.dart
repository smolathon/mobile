import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:json_string/json_string.dart';
import 'package:latlong2/latlong.dart';
import 'package:smolathon_mobile/model/RequestMaker.dart';
import 'package:smolathon_mobile/model/RequestMethods.dart';
import 'package:smolathon_mobile/model/api/Model.dart';

class Routes extends MainModel {
  late String id;
  String? title;
  String? description;
  String? img;
  LatLngBounds? bounds;

  static Routes fromJson(String jsn) {
    Map<String, dynamic> jsonString = JsonString(jsn).decodedValueAsMap;
    return Routes(
      id: jsonString["id"],
      title: jsonString["title"],
      description: jsonString["description"],
      img: jsonString["image"],
      bounds: LatLngBounds(
          LatLng(jsonString["edge_1"][0], jsonString["edge_1"][1]),
          LatLng(jsonString["edge_2"][0], jsonString["edge_2"][1])),
    );
  }

  @override
  Object toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "image": img,
      "edge_1": {"x": bounds?.north, "y": bounds?.west},
      "edge_2": {"x": bounds?.south, "y": bounds?.east}
    };
  }

  static Future<Routes> getRouteById(String id) async {
    return fromJson(
        await RequestMaker.request(url: "route/$id", method: HTTP_METHOD.GET));
  }

  static Future<List<Routes>> getAllRoutes() async {
    try {
      List<Routes> list = List<Routes>.empty(growable: true);
      final response =
          await RequestMaker.request(url: "route/0", method: HTTP_METHOD.GET);
      final jsonData = json.decode(response);
      print(jsonData);
      /*for (var element in jsonData) {
        list.add(Routes.fromJson(element));
      }*/
      list = (jsonData["routes"] as List<dynamic>)
          .map((data) {
            return Routes(id:data["id"].toString(), title: data["title"], description: data["description"], img: data["image"], bounds: LatLngBounds(LatLng(0,0), LatLng(90,90)));
      })
          .toList(growable: false);

      return list;
    } catch (e) {
      print("Error fetching routes: $e");
      return List<Routes>.empty();
    }
  }

  Routes(
      {required this.id, this.title, this.description, this.img, this.bounds});
}
