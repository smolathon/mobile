import 'dart:convert';

import 'package:flutter_map/flutter_map.dart';
import 'package:json_string/json_string.dart';
import 'package:latlong2/latlong.dart';
import 'package:smolathon_mobile/model/RequestMaker.dart';
import 'package:smolathon_mobile/model/RequestMethods.dart';
import 'package:smolathon_mobile/model/api/Model.dart';

class Point extends MainModel {
  late String id;
  String? title;
  String? description;
  String? img;
  LatLng? location;


  static Point fromJson(String jsn) {
    Map<String, dynamic> jsonString = JsonString(jsn).decodedValueAsMap;
    return Point(
      id: jsonString["id"],
      title: jsonString["title"],
      description: jsonString["description"],
      img: jsonString["image"],
      location: LatLng(jsonString["edge_1"]["x"], jsonString["edge_1"]["y"]),
    );

  }

  @override
  Object toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "image": img,
      "location": {"x":location?.longitude, "y":location?.latitude},
    };
  }

  static Future<Point> getPointById(String id) async {
    try {
      List<Point> list = List<Point>.empty(growable: true);
      final response =
      await RequestMaker.request(url: "point/$id", method: HTTP_METHOD.GET);
      final jsonData = json.decode(response);
      print(jsonData);
      /*for (var element in jsonData) {
        list.add(Point.fromJson(element));
      }*/
      list = (jsonData["Point"] as List<dynamic>)
          .map((data) {
        return Point(id:data["id"].toString(), title: data["title"], description: data["description"], img: data["image"], location: LatLng(data["location"][0], data["location"][1]));
      })
          .toList(growable: false);

      return list;
    } catch (e) {
      print("Error fetching Point: $e");
      return List<Point>.empty();
    }
  }
  static Future<List<Point>> getAllPoint() async {
    List<Point> list = List<Point>.empty(growable: true);
    for (var element in JsonString(await RequestMaker.request(
        url: "point/0", method: HTTP_METHOD.GET
    )).decodedValueAsList) { list.add(fromJson(element.toString()));}
    print(list);
    return list;
  }

  Point({required this.id, this.title, this.description, this.img, this.location});
}
