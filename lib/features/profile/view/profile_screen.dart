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
    String strLvl = 'Рыцарь ${x} уровня';

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Row(
            children: [
              Container(
                  child: InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: width * 0.22,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: width * 0.21,
                        backgroundImage: NetworkImage(
                          'https://i.ytimg.com/vi/OgGGaX7rOpw/maxresdefault.jpg',
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFF47b881),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              Container(
                  alignment: Alignment.centerLeft,
                  height: heigth * 0.4,
                  width: width * 0.56,
                  child: Stack(
                    children: <Widget>[
                      O3D(
                        src: filePath,
                        controller: o3dController,
                        ar: true,
                        autoRotate: true,
                        cameraControls: true,
                        cameraTarget: CameraTarget(0, 2, 0),
                        cameraOrbit: CameraOrbit(0, 90, 90),
                        disableZoom: true,
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            strLvl,
                            style: CustomTextStyles.listTitleTextStyle,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
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
