import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  final ImagePicker _imagePicker = ImagePicker();
  late String _selectedImagePath;

  late Future<User> _userData;

  @override
  void initState() {
    super.initState();
    _userData = fetchData();
    _selectedImagePath =
        'https://thumbs.dreamstime.com/b/та-исман-ш-ема-рыцаря-73835622.jpg';
  }

  Future<User> fetchData() async {
    return User.getByUsername("test_user");
  }

  Future<void> _pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text("Пожалуйста, подождите..."),
            ],
          ),
        );
      },
      barrierDismissible: false,
    );

    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          _selectedImagePath = image.path;
        });
      }
    } finally {
      Navigator.of(context).pop();
    }
  }

  Widget _body(var height, var width) {
    O3DController o3dController = O3DController();

    return FutureBuilder<User>(
      future: _userData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Ошибка загрузки данных'),
          );
        } else {
          User user = snapshot.data!;
          // Обновляем _selectedImagePath
          _selectedImagePath = user.image ??
              'https://thumbs.dreamstime.com/b/та-исман-ш-ема-рыцаря-73835622.jpg';

          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            CustomCard(
                              width: width * 0.47,
                              height: height * 0.24,
                              color: Colors.white,
                              child: InkWell(
                                onTap: _pickImage,
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: width * 0.22,
                                      backgroundColor: Colors.grey,
                                      child: CircleAvatar(
                                        radius: width * 0.205,
                                        backgroundImage:
                                            NetworkImage(_selectedImagePath),
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
                              height: height * 0.15,
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
                                        'Рыцарь ${user.level} уровня',
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
                          height: height * 0.4,
                          color: Colors.white,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Stack(
                              children: <Widget>[
                                O3D(
                                  src: 'assets/glb/knight_${user.level}lvl.glb',
                                  controller: o3dController,
                                  ar: true,
                                  autoRotate: true,
                                  cameraControls: true,
                                  cameraTarget: CameraTarget(0, 2, 0),
                                  cameraOrbit: CameraOrbit(0, 90, 90),
                                  disableZoom: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomCard(
                      width: width * 0.96,
                      height: height * 0.1,
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
                            user.username,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CustomCard(
                          width: width * 0.96,
                          height: height * 0.1,
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
                                user.email ?? "",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        CustomCard(
                          width: width * 0.96,
                          height: height * 0.1,
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
                                'Количество посещений: ${user.count ?? "Загрузка..."}',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
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
      drawer: const ComplexDrawer(),
    );
  }
}
