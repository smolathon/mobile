import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:smolathon_mobile/help_classes/exports.dart';
import 'package:smolathon_mobile/widgets/appbar_widget.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  O3DController o3dController = O3DController();

  Widget _body(var heigth, var width) {

    int x = 2; // значение переменной x (уровень)
    String fileName =
        'knight_${x}lvl.glb'; // формирование имени файла с использованием x
    String filePath =
        'assets/glb/$fileName'; // формирование полного пути к файлу

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Row(
            children: [
              Container(
                width: width - 200,
                child: Image.network(
                    'https://w.forfun.com/fetch/73/733f191603e506ccb1ba5d8674ebe412.jpeg'),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 300,
                width: 200,
                child: O3D(
                  src: filePath,
                  controller: o3dController,
                  ar: true,
                  autoRotate: true,
                  cameraControls: true,
                  cameraTarget: CameraTarget(0, 2, 0),
                  cameraOrbit: CameraOrbit(0, 90, 90),
                  disableZoom: true,
                ),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: Text('Элемент $index'),
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
