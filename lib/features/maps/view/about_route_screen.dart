import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
