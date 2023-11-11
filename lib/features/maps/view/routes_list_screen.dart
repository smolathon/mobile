
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smolathon_mobile/router/router.dart';

import '../../../help_classes/colors.dart';
import '../../../model/api/PointModel.dart';
import '../../../model/api/RoutesModel.dart';
import '../../../widgets/exports.dart';

class RouteListScreen extends StatefulWidget {
  const RouteListScreen({Key? key}) : super(key: key);


  @override
  State<RouteListScreen> createState() => _RouteListScreenState();
}

class _RouteListScreenState extends State<RouteListScreen>{
  late List<GeoRoute>routes  = [
    GeoRoute(
      id: '1',
      title: '\u041d\u0430\u0447\u0430\u043b\u043e \u0438\u0441\u0442\u043e\u0440\u0438\u0438',
      description: '\u041f\u0440\u043e\u0433\u0443\u043b\u043a\u0430 \u043f\u043e \u043a\u0443\u0440\u0433\u0430\u043d\u0443 \u043f\u0440\u0435\u0434\u043e\u0441\u0442\u0430\u0432\u0438\u0442 \u0443\u0434\u0438\u0432\u0438\u0442\u0435\u043b\u044c\u043d\u044b\u0435 \u0432\u0438\u0434\u044b \u043d\u0430 \u043e\u043a\u0440\u0443\u0436\u0430\u044e\u0449\u0438\u0439 \u043b\u0430\u043d\u0434\u0448\u0430\u0444\u0442. \u0412\u0430\u0436\u043d\u043e \u043f\u043e\u0441\u0435\u0442\u0438\u0442\u044c \u0441\u0430\u043c\u044b\u0439 \u0432\u0435\u0440\u0445 \u043a\u0443\u0440\u0433\u0430\u043d\u0430, \u0447\u0442\u043e\u0431\u044b \u043d\u0430\u0441\u043b\u0430\u0434\u0438\u0442\u044c\u0441\u044f \u0432\u0435\u043b\u0438\u043a\u043e\u043b\u0435\u043f\u043d\u044b\u043c \u043f\u0430\u043d\u043e\u0440\u0430\u043c\u043d\u044b\u043c \u0432\u0438\u0434\u043e\u043c \u043d\u0430 \u043e\u043a\u0440\u0443\u0436\u0430\u044e\u0449\u0438\u0435 \u0445\u043e\u043b\u043c\u044b \u0438 \u0434\u043e\u043b\u0438\u043d\u044b. \u0417\u0434\u0435\u0441\u044c \u0442\u044b \u0441\u043c\u043e\u0436\u0435\u0448\u044c \u043e\u0449\u0443\u0442\u0438\u0442\u044c \u0434\u044b\u0445\u0430\u043d\u0438\u0435 \u0438\u0441\u0442\u043e\u0440\u0438\u0438, \u043f\u043e\u0433\u0440\u0443\u0436\u0430\u044f\u0441\u044c \u0432 \u0430\u0442\u043c\u043e\u0441\u0444\u0435\u0440\u0443 \u0434\u0440\u0435\u0432\u043d\u043e\u0441\u0442\u0438. \u041d\u0430 \u0441\u043a\u043b\u043e\u043d\u0430\u0445 \u043a\u0443\u0440\u0433\u0430\u043d\u0430 \u0440\u0430\u0441\u0442\u0443\u0442 \u0440\u0430\u0437\u043d\u043e\u043e\u0431\u0440\u0430\u0437\u043d\u044b\u0435 \u0440\u0430\u0441\u0442\u0435\u043d\u0438\u044f, \u0447\u0442\u043e \u0434\u0435\u043b\u0430\u0435\u0442 \u043f\u0440\u043e\u0433\u0443\u043b\u043a\u0443 \u0431\u043e\u043b\u0435\u0435 \u043f\u0440\u0438\u044f\u0442\u043d\u043e\u0439. \u041f\u0440\u0438\u0445\u0432\u0430\u0442\u0438 \u0441 \u0441\u043e\u0431\u043e\u0439 \u043a\u043d\u0438\u0433\u0443 \u0438\u043b\u0438 \u0433\u0438\u0442\u0430\u0440\u0443 \u2014 \u043a\u0443\u0440\u0433\u0430\u043d \u043f\u0440\u0435\u043a\u0440\u0430\u0441\u043d\u043e \u043f\u043e\u0434\u0445\u043e\u0434\u0438\u0442 \u0434\u043b\u044f \u0442\u043e\u0433\u043e, \u0447\u0442\u043e\u0431\u044b \u043f\u0440\u043e\u0432\u0435\u0441\u0442\u0438 \u0432\u0440\u0435\u043c\u044f \u0432 \u0443\u0435\u0434\u0438\u043d\u0435\u043d\u0438\u0438 \u0441 \u043f\u0440\u0438\u0440\u043e\u0434\u043e\u0439 \u0438\u043b\u0438 \u043f\u043e\u0434 \u043c\u0443\u0437\u044b\u043a\u0443.',
      points: [
        GeoPoint(
          id: '1',
          title: 'Точка 1',
          description: 'Описание точки 1',
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        GeoPoint(
          id: '2',
          title: 'Точка 2',
          description: 'Описание точки 2',
          latitude: 34.0522,
          longitude: -118.2437,
        ),
      ],
    ),
    GeoRoute(
      id: '2',
      title: 'Маршрут 2',
      description: 'Описание маршрута 2',
      points: [
        GeoPoint(
          id: '3',
          title: 'Точка 3',
          description: 'Описание точки 3',
          latitude: 51.5074,
          longitude: -0.1278,
        ),
        GeoPoint(
          id: '4',
          title: 'Точка 4',
          description: 'Описание точки 4',
          latitude: 35.6895,
          longitude: 139.6917,
        ),
      ],
    ),
  ];
  bool initialized = false;
  Future<List<GeoRoute>>? _futureRoutes;

  Future<void> load() async {
    await Routes.getAllRoutes().then((value) => setState(()  {
      (()async{

        routes = await Future.wait(value.map((e) async {
          return GeoRoute(
              id: e.id,
              title: e.title,
              description: e.description,
              points: (await Pointasdasdasdasd.getPointById(e.id))
                  .map((e) =>
                  GeoPoint(
                      id: e.id,
                      latitude: e.location!.latitude,
                      longitude: e.location!.longitude,
                      title: e.title,
                      description: e.description))
                  .toList());
        }));
        print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ya jenshina");
      })();
    }));
  }
  @override
  void initState() {
    super.initState();
    load();
  }

  Widget _body(var height, var width) {
          return ListView.builder(
            itemCount: routes.length,
            itemBuilder: (context, index) {
              GeoRoute route = routes[index];
              return CustomCard(
                width: width * 0.9,
                height: height * 0.1,
                child: ListTile(
                  title: Text(route.title ?? ''),
                  subtitle: Text(route.description ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RouteDetails(route: route),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Маршруты',
        backgroundColor: MyColor.darkBlue3D5060,
        iconColor: MyColor.midleGrey7CA3BA,
      ),
      body: _body(height, width),
    );
  }
}

class RouteDetails extends StatelessWidget {
  final GeoRoute route;

  RouteDetails({required this.route});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar:CustomAppBar(
        title: route.title ?? '',
        backgroundColor: MyColor.darkBlue3D5060,
        iconColor: MyColor.midleGrey7CA3BA,
      ),

      body: ListView.builder(
        itemCount: route.points.length,
        itemBuilder: (context, index) {
          GeoPoint point = route.points[index];
          return CustomCard(
            width: width * 0.9,
            height: height * 0.1,
            child: ListTile(
              title: Text(point.title ?? ''),
              subtitle: Text(point.description ?? ''),
              onTap: () {
// Действие при нажатии на точку маршрута
                AutoRouter.of(context).push(PointMapRoute(id: point.id));
              },
            ),
          );
        },
      ),
    );
  }
}

class GeoRoute {
  late String id;
  String? title;
  String? description;
  List<GeoPoint> points;

  GeoRoute({
    required this.id,
    this.title,
    this.description,
    this.points = const [],
  });

  factory GeoRoute.fromJson(Map<String, dynamic> json) {
    return GeoRoute(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      points: (json['points'] as List<dynamic>)
          .map((pointData) => GeoPoint.fromJson(pointData))
          .toList(),
    );
  }
}

class GeoPoint {
  late String id;
  String? title;
  String? description;
  double latitude;
  double longitude;

  GeoPoint({
    required this.id,
    this.title,
    this.description,
    required this.latitude,
    required this.longitude,
  });

  factory GeoPoint.fromJson(Map<String, dynamic> json) {
    return GeoPoint(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
    );
  }
}
