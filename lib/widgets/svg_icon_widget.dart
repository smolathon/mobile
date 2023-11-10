import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgIcon extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;
  final Color? color;
  final double? height;
  final double? width;

  CustomSvgIcon({
    required this.imagePath,
    this.onTap,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Обрабатываем нажатие
      child: Container(
        width:
            width, // Задайте ширину контейнера в соответствии с вашей иконкой
        height:
            height, // Задайте высоту контейнера в соответствии с вашей иконкой
        child: SvgPicture.asset(
          imagePath,
          color: color, // Установите цвет иконки, если необходимо
        ),
      ),
    );
  }
}


/* Пример
CustomSvgIcon(
            //Лого в закрытом меню
            imagePath: 'assets/svg/istoki_logo.svg',
            color: Colors.white,
            width: 100,
            height: 100,
          ), */