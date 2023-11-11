import 'package:flutter/material.dart';

class RoutesListScreen extends StatefulWidget {
  @override
  _RoutesListScreenState createState() => _RoutesListScreenState();
}

class _RoutesListScreenState extends State<RoutesListScreen> {
  List<GeoRoute> routes = [
    GeoRoute(
      id: '1',
      title: 'Маршрут 1',
      description: 'Описание маршрута 1',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список маршрутов'),
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index) {
          GeoRoute route = routes[index];
          return ListTile(
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
          );
        },
      ),
    );
  }
}

class RouteDetails extends StatelessWidget {
  final GeoRoute route;

  RouteDetails({required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(route.title ?? ''),
      ),
      body: ListView.builder(
        itemCount: route.points.length,
        itemBuilder: (context, index) {
          GeoPoint point = route.points[index];
          return ListTile(
            title: Text(point.title ?? ''),
            subtitle: Text(point.description ?? ''),
            onTap: () {
              // Действие при нажатии на точку маршрута
            },
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
}
