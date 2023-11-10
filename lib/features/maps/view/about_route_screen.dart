import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_directions/flutter_map_directions.dart';
import 'package:latlong2/latlong.dart';
import 'package:smolathon_mobile/router/router.dart';
import 'package:smolathon_mobile/widgets/exports.dart';

import '../../../help_classes/exports.dart';

@RoutePage()
class AboutRouteScreen extends StatefulWidget {
  const AboutRouteScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<AboutRouteScreen> createState() => _AboutRouteScreenState(id);
}

class _AboutRouteScreenState extends State<AboutRouteScreen> {
  _AboutRouteScreenState(this.id);

  final String id;

  Widget _body(var height, var width) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: height * 0.3,
                child: PageView(
                  children: [
                    Image.network("http://peachmeetspine.com/wp-content/uploads/2014/06/16-9-dummy-image2.jpg"),
            FlutterMap(
              options: MapOptions(
                center: const LatLng(54.78138, 31.88008),
                zoom: 15,
                maxBounds: LatLngBounds(
                    const LatLng(54.79954357505826, 31.8166623460582),
                    const LatLng(54.77603517517966, 31.93913057436074)),
                minZoom: 15,
                maxZoom: 18,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                DirectionsLayer(
                  coordinates: [
                    DirectionCoordinate(54.7858485323177, 31.87947811552349),
                    DirectionCoordinate(54.78372451541789, 31.882868342999693),
                    DirectionCoordinate(54.78252241548917, 31.881140366113904),
                  ],
                  color: Colors.red,
                )
              ],
            ),
                  ],
                ),
              ),
              Text('Маршрут $id', style: CustomTextStyles.listTitleTextStyle),
              const Text(
                'Он очень крутой проходит через все классные точки мира блин нафик очень советую его посетить все кто его посещали ставили 5 звёзд после посещения очень классная погода природа атмосфера ээээээээээ !',
                style: CustomTextStyles.listSecondTextStyle,
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              index += 1;
              return Column(
                children: [
                  ListTile(
                    leading: const FlutterLogo(size: 64.0),
                    title: Text('Точка $index',
                        style: CustomTextStyles.listTitleTextStyle),
                    onTap: () {
                      AutoRouter.of(context).replace(PointMapRoute(id: id));
                    },
                  ),
                  const Divider(
                    height: 2,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ],
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }

  CustomAppBar _appBar() {
    return CustomAppBar(
      title: 'О маршруте',
      backgroundColor: MyColor.darkBlue3D5060,
      iconColor: MyColor.midleGrey7CA3BA,
      borderRadius: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = mounted ? MediaQuery.of(context).size.height : 10;
    final width = mounted ? MediaQuery.of(context).size.width : 10;
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: _appBar(),
      body: _body(height, width),
      drawer: ComplexDrawer(),
    );
  }
}
