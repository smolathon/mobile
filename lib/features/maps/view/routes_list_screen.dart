import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smolathon_mobile/help_classes/exports.dart';
import 'package:smolathon_mobile/widgets/exports.dart';

@RoutePage()
class RouteListScreen extends StatefulWidget {
  const RouteListScreen({Key? key}) : super(key: key);

  @override
  State<RouteListScreen> createState() => _RouteListScreenState();
}

class _RouteListScreenState extends State<RouteListScreen> {
  Widget _body(var heigth, var width) {
    return Center();
  }

  CustomAppBar _appBar() {
    return CustomAppBar(
      title: 'Ваш профиль',
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
