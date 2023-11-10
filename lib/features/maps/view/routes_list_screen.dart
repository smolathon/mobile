import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smolathon_mobile/features/maps/view/about_route_screen.dart';
import 'package:smolathon_mobile/help_classes/exports.dart';
import 'package:smolathon_mobile/widgets/exports.dart';

import '../../../router/router.dart';

@RoutePage()
class RouteListScreen extends StatefulWidget {
  const RouteListScreen({Key? key}) : super(key: key);

  @override
  State<RouteListScreen> createState() => _RouteListScreenState();
}

class _RouteListScreenState extends State<RouteListScreen> {
  Widget _body(var heigth, var width) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(children: [
                ListTile(
                  leading: const FlutterLogo(size: 64.0),
                  title: Text('Маршрут $index',
                      style: CustomTextStyles.listTitleTextStyle),
                  onTap: () {
                    AutoRouter.of(context).replace(AboutRouteRoute(id: '123'));
                    // AutoRouter.of(context).replace(AboutRouteRoute(id: "123"));
                  },
                  isThreeLine: true,
                  subtitle: const Text(
                      'Описание: маршрут очень крутой проходит через все классные точки блин !',
                      style: CustomTextStyles.listSecondTextStyle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis),
                ),
                const Divider(
                  height: 2,
                  thickness: 0.5,
                  color: Colors.grey,
                ),
              ]);
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }

  CustomAppBar _appBar() {
    return CustomAppBar(
      title: 'Маршруты',
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
