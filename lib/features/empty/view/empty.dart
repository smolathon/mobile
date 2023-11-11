import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smolathon_mobile/model/api/RoutesModel.dart';

@RoutePage()
class EmptyScreen extends StatefulWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:() {
      //Routes.getAllRoutes();

      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      print("guide how to sleep");
      //.then((value) => print(value)).catchError(print);
    }, child: Text("ale "));
  }
}