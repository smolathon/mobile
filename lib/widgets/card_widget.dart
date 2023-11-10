import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color shadowColor;
  final Widget child;
  final VoidCallback onTap;

  const CustomCard({
    Key? key,
    required this.width,
    required this.height,
    this.color = Colors.white,
    required this.child,
    this.shadowColor = const Color(0xFFB7D0E1),
    this.onTap = _defaultOnTap,
  }) : super(key: key);

  static void _defaultOnTap() {
    // Пустая реализация по умолчанию
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.8),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(1, 7), // Вверх, в 2 раза меньше по высоте
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8), // Регулируйте отступы здесь
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: child,
          ),
        ),
      ),
    );
  }
}
