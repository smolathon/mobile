import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:smolathon_mobile/widgets/exports.dart';

import '../../../help_classes/exports.dart';

@RoutePage()
class PointMapScreen extends StatefulWidget {
  const PointMapScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<PointMapScreen> createState() => _PointMapScreenState(id);
}

class _PointMapScreenState extends State<PointMapScreen> {
  _PointMapScreenState(this.id);

  final String id;

  Widget _body(var height, var width) {
    return FlutterMap(
      options: MapOptions(
          center: const LatLng(54.78138, 31.88008),

        zoom: 15,
        maxBounds: LatLngBounds(
            LatLng(54.785647513439166, 31.87085078433421),
            LatLng(54.78697645359639, 31.896524295791707)
        ),        minZoom: 15,
        maxZoom: 19,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        )
      ],
    );
  }

  CustomAppBar _appBar() {
    return CustomAppBar(
      title: 'Маршрут #$id',
      backgroundColor: MyColor.darkBlue3D5060,
      iconColor: MyColor.midleGrey7CA3BA,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: _appBar(),
      body: _body(height, width),
      drawer: ComplexDrawer(),
    );
  }
}
