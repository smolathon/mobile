import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:smolathon_mobile/widgets/exports.dart';
import 'package:flutter_map_directions/flutter_map_directions.dart';

import '../../../help_classes/exports.dart';
import '../../../router/router.dart';

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
    late PageController pageController = PageController();

    @override
    void initState() {
      super.initState();
      pageController = PageController(initialPage: 0);
    }

    @override
    void dispose() {
      pageController.dispose();
      super.dispose();
    }

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
                  controller: pageController,
                  children: [
                    // Первая страница
                    Stack(
                      children: [
                        Image.network(
                          "https://gazeta-proregion.ru/wp-content/uploads/2022/09/gnezdovo-pamyatnik.png",
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color.fromARGB(200, 200, 200, 200),
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                              color: Colors.white,
                              onPressed: () {
                                // Переход на следующую страницу
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Вторая страница
                    Stack(
                      children: [
                        FlutterMap(
                          options: MapOptions(
                            center: const LatLng(54.78138, 31.88008),
                            zoom: 15,
                            maxBounds: LatLngBounds(
                              const LatLng(54.79954357505826, 31.8166623460582),
                              const LatLng(
                                  54.77603517517966, 31.93913057436074),
                            ),
                            minZoom: 15,
                            maxZoom: 18,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            ),
                            MarkerLayer(markers: [
                              Marker(
                                point: LatLng(54.7858485323177, 31.87947811552349), builder: (BuildContext context) { return Icon(Icons.map_outlined, color: Colors.red,); },
                              ),
                            ],),

                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: InkWell(
                            onTap: () {
                              // Переход на предыдущую страницу
                              pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor:
                              Color.fromARGB(200, 200, 200, 200),
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text('Маршрут $id', style: CustomTextStyles.listTitleTextStyle),
              const Text(
                '\u041f\u0440\u043e\u0433\u0443\u043b\u0438\u0432\u0430\u0439\u0441\u044f \u0441\u0440\u0435\u0434\u0438 \u0434\u0440\u0435\u0432\u043d\u0438\u0445 \u0434\u0435\u0440\u0435\u0432\u044c\u0435\u0432, \u0441\u043e\u0437\u0434\u0430\u0432\u0430\u044f \u0430\u0442\u043c\u043e\u0441\u0444\u0435\u0440\u0443 \u0441\u043f\u043e\u043a\u043e\u0439\u0441\u0442\u0432\u0438\u044f \u0438 \u0437\u0430\u0433\u0430\u0434\u043e\u0447\u043d\u043e\u0441\u0442\u0438 \u0432 \u0441\u0430\u043a\u0440\u0430\u043b\u044c\u043d\u043e\u0439 \u0440\u043e\u0449\u0435 \u043d\u0430 \u0413\u043d\u0451\u0437\u0434\u043e\u0432\u0441\u043a\u043e\u043c \u043a\u0443\u0440\u0433\u0430\u043d\u0435. \u0417\u0434\u0435\u0441\u044c \u043a\u0430\u0436\u0434\u043e\u0435 \u0434\u0435\u0440\u0435\u0432\u043e \u043a\u0430\u0436\u0435\u0442\u0441\u044f \u0445\u0440\u0430\u043d\u0438\u0442\u0435\u043b\u0435\u043c \u0442\u0430\u0439\u043d \u0438 \u043b\u0435\u0433\u0435\u043d\u0434, \u0440\u0430\u0441\u043a\u0440\u044b\u0432\u0430\u044f \u0441\u0432\u043e\u0438 \u0432\u0435\u0442\u0432\u0438, \u0441\u043b\u043e\u0432\u043d\u043e \u0430\u043d\u0442\u0438\u0447\u043d\u044b\u0435 \u0441\u0432\u0438\u0442\u043a\u0438 \u0441 \u0438\u0441\u0442\u043e\u0440\u0438\u044f\u043c\u0438 \u043f\u0440\u043e\u0448\u043b\u043e\u0433\u043e. \u042d\u0442\u043e \u0438\u0434\u0435\u0430\u043b\u044c\u043d\u043e\u0435 \u043c\u0435\u0441\u0442\u043e \u0434\u043b\u044f \u0442\u0435\u0445, \u043a\u0442\u043e \u0446\u0435\u043d\u0438\u0442 \u043f\u0440\u0438\u0440\u043e\u0434\u0443, \u043c\u0438\u0441\u0442\u0438\u043a\u0443 \u0438 \u0443\u0435\u0434\u0438\u043d\u0435\u043d\u0438\u0435',
                style: CustomTextStyles.listSecondTextStyle,
              ),
            ],
          ),
        ),

      ],
    );
  }
  // Widget _body(var height, var width) {
  //   return FlutterMap(
  //     options: MapOptions(
  //       center: const LatLng(54.78138, 31.88008),
  //       zoom: 15,
  //       maxBounds: LatLngBounds(
  //           const LatLng(54.79954357505826, 31.8166623460582),
  //           const LatLng(54.77603517517966, 31.93913057436074)),
  //       minZoom: 15,
  //       maxZoom: 18,
  //     ),
  //     children: [
  //       TileLayer(
  //         urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  //       ),
  //       DirectionsLayer(
  //         coordinates: [
  //           DirectionCoordinate(54.7858485323177, 31.87947811552349),
  //           DirectionCoordinate(54.78372451541789, 31.882868342999693),
  //           DirectionCoordinate(54.78252241548917, 31.881140366113904),
  //         ],
  //         color: Colors.red,
  //       )
  //     ],
  //   );
  // }

  CustomAppBar _appBar() {
    return CustomAppBar(
      title: 'Точка #$id',
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
      drawer: const ComplexDrawer(),
    );
  }
}
