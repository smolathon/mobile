import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smolathon_mobile/help_classes/exports.dart';
import 'package:smolathon_mobile/router/router.dart';
import 'package:smolathon_mobile/widgets/exports.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _buildBody(),
      drawer: ComplexDrawer(),
      drawerScrimColor: Colors.transparent,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildBody() {
    return Builder(
      builder: (context) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            // Изображение в качестве фона
            Image.asset(
              'assets/png/registration_back.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            _buildTopContent(),
            _buildMenuIcon(context), // Передаем контекст в метод _buildMenuIcon
          ],
        );
      },
    );
  }

  Widget _buildTopContent() {
    return Positioned(
      top: screenHeight * 0.1, // Отступ сверху
      child: Column(
        children: [
          CustomSvgIcon(
            imagePath: 'assets/svg/istoki_logo.svg',
            color: Colors.white,
            width: screenWidth * 1,
            height: 110,
          ),
          const Text(
            'Истоки',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            height: screenHeight * 0.05,
          ),
          const Text(
            'Добро пожаловать',
            style: CustomTextStyles.titleTextStyle,
          ),
          Container(
            height: screenHeight * 0.01,
          ),
          const Text(
            'Войдите, чтобы продолжить',
            style: CustomTextStyles.secondTextStyle,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.04,
              horizontal: screenWidth * 0.1,
            ),
            child: Column(
              children: [
                buildCustomTextField('Имя', false, nameController),
                buildCustomTextField('Почта', false, emailController),
                buildCustomTextField('Пароль', true, passwordController),
                SizedBox(height: screenHeight * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.4,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          AutoRouter.of(context).push(SignInRoute());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onPrimary: Colors.white,
                          side: BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        child: const Text(
                          'Вход',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    SizedBox(
                      width: screenWidth * 0.4,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          //Действия при нажатии на Регистрация
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          side: BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        child: const Text(
                          'Регистрация',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuIcon(BuildContext context) {
    // Принимаем контекст как параметр
    return Positioned(
      top: screenHeight * 0.05,
      left: screenWidth * 0.05,
      child: IconButton(
        iconSize: 30,
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {
          Scaffold.of(context)
              .openDrawer(); // Используем переданный контекст здесь
        },
      ),
    );
  }

  Widget buildCustomTextField(
      String labelText, bool isPassword, TextEditingController controller) {
    return SizedBox(
      height: screenHeight * 0.11,
      width: screenWidth * 0.9,
      child: CustomTextField(
        labelText: labelText,
        focusColor: Colors.white,
        fillColor: MyColor.whiteForInputFill,
        isPassword: isPassword,
        controller: controller,
      ),
    );
  }
}
