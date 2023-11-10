import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smolathon_mobile/widgets/exports.dart';

import '../../../help_classes/exports.dart';

@RoutePage()
class AboutRouteScreen extends StatefulWidget {
  const AboutRouteScreen({Key? key, /*@PathParam('id') this.id*/}) : super(key: key);

  final String? id = "123";

  @override
  State<AboutRouteScreen> createState() => _AboutRouteScreenState();
}

class _AboutRouteScreenState extends State<AboutRouteScreen> {
  Widget _body(var heigth, var width) {
    return Center();
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