import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color iconColor;
  final double borderRadius;
  final List<Widget>? iconButtons; // Используйте nullable тип

  CustomAppBar({
    required this.title,
    required this.backgroundColor,
    required this.iconColor,
    this.borderRadius = 20.0,
    this.iconButtons, // Добавлен параметр для списка виджетов
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: iconColor),
      title: Text(
        title,
        style: TextStyle(color: iconColor),
      ),
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      backgroundColor: backgroundColor,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      ),
      actions:
          iconButtons ?? [], // Используйте пустой список, если iconButtons null
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
