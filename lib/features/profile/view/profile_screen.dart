import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:smolathon_mobile/help_classes/exports.dart';
import 'package:smolathon_mobile/widgets/appbar_widget.dart';
import 'package:smolathon_mobile/widgets/exports.dart';

import '../../../model/api/UserModel.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  O3DController o3dController = O3DController();

  late User user = User(username: "крутой2012", email:"ochen'krutoy'chelovek@gmail.com", password: "52", role: "User");

  Widget _body(var heigth, var width) {
    int x = 2; // значение переменной x (уровень)
    int? count = user.count; //колличество посищений мероприятия
    String fileName =
        'knight_${x}lvl.glb'; // формирование имени файла с использованием x
    String filePath =
        'assets/glb/$fileName'; // формирование полного пути к файлу
    String strLvl = '''Рыцарь      ${x} уровня''';
    String countStr = 'Количество посещений: ${count ?? "Загрузка..."}';
    String mailStr = user.email ?? "";
    String nikStr = user.username;

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(children: [
            Row(
              children: [
                Column(
                  children: [
                    CustomCard(
                      width: width * 0.47,
                      height: heigth * 0.24,
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {},
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: width * 0.22,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                radius: width * 0.205,
                                backgroundImage: const NetworkImage(
                                  'https://i.ytimg.com/vi/OgGGaX7rOpw/maxresdefault.jpg',
                                ),
                              ),
                            ),
                            const Positioned(
                              bottom: 2,
                              right: 2,
                              child: CircleAvatar(
                                radius: 20,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                backgroundColor: Color(0xFF47b881),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomCard(
                      width: width * 0.47,
                      height: heigth * 0.15,
                      color: Colors.white,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                              child: Icon(
                                Icons.shield_outlined,
                                size: 40,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: width * 0.03),
                            Flexible(
                              child: Text(
                                strLvl,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                CustomCard(
                  width: width * 0.47,
                  height: heigth * 0.4,
                  color: Colors.white,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      children: <Widget>[
                        /*O3D(
                          src: filePath,
                          controller: o3dController,
                          ar: true,
                          autoRotate: true,
                          cameraControls: true,
                          cameraTarget: CameraTarget(0, 2, 0),
                          cameraOrbit: CameraOrbit(0, 90, 90),
                          disableZoom: true,
                        ),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
            CustomCard(
              width: width * 0.96,
              height: heigth * 0.1,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  Text(
                    nikStr,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CustomCard(
                  width: width * 0.96,
                  height: heigth * 0.1,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        child: const Icon(
                          Icons.mail_outline,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Text(
                        mailStr,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                CustomCard(
                  width: width * 0.96,
                  height: heigth * 0.1,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        child: const Icon(
                          Icons.done_all,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Text(
                        countStr,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
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
  Widget build(BuildContext context)  {
    User.getByUsername("test_user").then((value) => user = value);
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
