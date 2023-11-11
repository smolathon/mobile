import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:smolathon_mobile/help_classes/exports.dart';
import 'package:smolathon_mobile/model/RequestMaker.dart';
import 'package:smolathon_mobile/model/api/UserModel.dart';
import 'package:smolathon_mobile/router/router.dart';
import 'package:smolathon_mobile/widgets/exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool isPasswordVisible;

  @override
  void initState() {
    super.initState();
    isPasswordVisible = false;
  }

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
            Image.asset(
              'assets/png/registration_back.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            _buildTopContent(),
            _buildMenuIcon(context),
          ],
        );
      },
    );
  }

  Widget _buildTopContent() {
    return Positioned(
      top: screenHeight * 0.1,
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
          Text(
            'Добро пожаловать',
            style: CustomTextStyles.titleTextStyle,
          ),
          Container(
            height: screenHeight * 0.01,
          ),
          Text(
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
                buildCustomTextField('Никнейм', false, usernameController),
                buildCustomTextField('Пароль', true, passwordController),
                const Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    color: Color.fromARGB(170, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: screenHeight * 0.185),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.4,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _login(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          side: BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        child: Text(
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
                          AutoRouter.of(context).push(SignUpRoute());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onPrimary: Colors.white,
                          side: BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        child: Text(
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
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }

  Widget buildCustomTextField(
      String labelText, bool isPassword, TextEditingController controller) {
    double textSize = 17;
    double borderRadius = 100;

    return SizedBox(
      height: screenHeight * 0.11,
      width: screenWidth * 0.9,
      child: TextField(
        style: TextStyle(
          color: Colors.white,
          fontSize: textSize,
        ),
        obscureText: isPassword && !isPasswordVisible,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: textSize,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.9,
          ),
          fillColor: MyColor.whiteForInputFill,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          suffixIcon: isPassword
              ? Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                )
              : null,
        ),
      ),
    );
  }

  String? authToken; // переменная для хранения токена

  Future<void> _login(BuildContext context) async {
    final url = Uri.parse('https://' + RequestMaker.API_URL + '/user/login');
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> body = {
      'username': usernameController.text,
      'password': passwordController.text,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);

        // Получите токен из ответа сервера
        _saveToken(usernameController.text);
        // Дождитесь завершения сохранения токена

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Вы успешно вошли'),
          ),
        );

        // Добавьте необходимый код для обработки успешного входа
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Пользователь не существует или пароль неверный'),
          ),
        );
      } else {
        throw Exception('Failed to login');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Произошла ошибка: $error'),
        ),
      );
    }
  }

  Future<void> _saveToken(String token) async {
    // Сохраните токен в хранилище приложения, например, используя пакет shared_preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);

    // Обновите состояние виджета
    setState(() {
      authToken = token;
    });
  }
}
