import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutRouteScreen extends StatefulWidget {
  const AboutRouteScreen({Key? key}) : super(key: key);

  @override
  State<AboutRouteScreen> createState() => _AboutRouteScreenState();
}

class _AboutRouteScreenState extends State<AboutRouteScreen> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}