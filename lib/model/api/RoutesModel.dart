import 'dart:convert';

import 'package:flutter_map/flutter_map.dart';
import 'package:json_string/json_string.dart';
import 'package:latlong2/latlong.dart';
import 'package:smolathon_mobile/model/RequestMaker.dart';
import 'package:smolathon_mobile/model/RequestMethods.dart';
import 'package:smolathon_mobile/model/api/Model.dart';

class Routes extends Model {
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
        bounds: LatLngBounds(LatLng(jsonString["edge_1"]["x"], jsonString["edge_1"]["y"]), LatLng(jsonString["edge_2"]["x"], jsonString["edge_2"]["y"])),
    );

  }

  @override
  Object toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "image": img,
      "edge_1": {"x":bounds?.north, "y":bounds?.west},
      "edge_2":{"x":bounds?.south, "y":bounds?.east}
    };
  }

  static Future<Routes> getRouteById(String id) async {
    return fromJson(await RequestMaker.request(
        url: "route/$id", method: HTTP_METHOD.GET));
  }
  static Future<List<Routes>> getAllRoutes() async {
    print("52 alo");
    List<Routes> list = List<Routes>.empty(growable: true);
    for (var element in JsonString(await RequestMaker.request(
        url: "route/0", method: HTTP_METHOD.GET
    )).decodedValueAsList) { list.add(fromJson(element.toString()));}
    print(list);
    return list;
  }

  Routes({required this.id, this.title, this.description, this.img, this.bounds});
}
