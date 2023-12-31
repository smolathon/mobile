import 'dart:convert';

import 'package:flutter_map/flutter_map.dart';
import 'package:json_string/json_string.dart';
import 'package:latlong2/latlong.dart';
import 'package:smolathon_mobile/model/RequestMaker.dart';
import 'package:smolathon_mobile/model/RequestMethods.dart';
import 'package:smolathon_mobile/model/api/Model.dart';

class Pointasdasdasdasd extends MainModel {
  late String id;
  String? title;
  String? description;
  String? img;
  LatLng? location;


  static Pointasdasdasdasd fromJson(String jsn) {
    Map<String, dynamic> jsonString = JsonString(jsn).decodedValueAsMap;
    return Pointasdasdasdasd(
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

  static Future<List<Pointasdasdasdasd>> getPointById(String id) async {
    try {
      List<Pointasdasdasdasd> list = List<Pointasdasdasdasd>.empty(growable: true);
      final response =
      await RequestMaker.request(url: "point/$id", method: HTTP_METHOD.GET);
      final jsonData = json.decode(response);
      print(jsonData);
      /*for (var element in jsonData) {
        list.add(Point.fromJson(element));
      }*/
      list = (jsonData["points"] as List<dynamic>)
          .map((data) {
        return Pointasdasdasdasd(id:data["id"].toString(), title: data["title"], description: data["description"], img: data["image"], location: LatLng(0,0/*data["location"][0], data["location"][1]*/));
      })
          .toList(growable: false);

      return list;
    } catch (e) {
      print("Error fetching Point: $e");
      return List<Pointasdasdasdasd>.empty();
    }
  }
  static Future<List<Pointasdasdasdasd>> getAllPoint() async {
    List<Pointasdasdasdasd> list = List<Pointasdasdasdasd>.empty(growable: true);
    for (var element in JsonString(await RequestMaker.request(
        url: "point/0", method: HTTP_METHOD.GET
    )).decodedValueAsList) { list.add(fromJson(element.toString()));}
    print(list);
    return list;
  }

  Pointasdasdasdasd({required this.id, this.title, this.description, this.img, this.location});
}
