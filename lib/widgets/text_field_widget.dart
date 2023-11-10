import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final Color focusColor;
  final Color enabledColor;
  final Color fillColor;
  final bool isPassword;

  CustomTextField({
    required this.labelText,
    this.focusColor = Colors.white,
    this.enabledColor = Colors.grey,
    this.fillColor = Colors.blue,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    double textSize = 17;
    double borderRadius = 100;

    return TextField(
      style: TextStyle(
        color: widget.focusColor,
        fontSize: textSize,
      ),
      obscureText: _obscureText,
      decoration: InputDecoration(
        focusColor: widget.focusColor,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.focusColor,
          fontSize: textSize,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.9,
        ),
        fillColor: widget.fillColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.enabledColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.focusColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        suffixIcon: widget.isPassword
            ? Padding(
                padding:
                    EdgeInsets.only(right: 12.0), // Отступ справа для глазика
                child: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              )
            : null,
      ),
    );
  }
}
