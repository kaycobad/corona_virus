import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Function onPressed;
  final Color containerColor;
  final IconData icon;
  final Color iconColor;
  SocialButton(
      {@required this.onPressed,
      @required this.containerColor,
      @required this.icon,
      @required this.iconColor});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(
        minHeight: 40,
        minWidth: 40,
      ),
      onPressed: onPressed,
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: containerColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(
          icon,
          size: 18,
          color: iconColor,
        ),
      ),
    );
  }
}
