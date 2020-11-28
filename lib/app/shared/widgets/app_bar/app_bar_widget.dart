import 'package:flutter/material.dart';

/// Classe responsável por construir uma appBar personalizada.
class AppBarWidget extends PreferredSize {
  final double height;
  final double elevation;
  final bool back;
  final Widget content;
  final double radius;
  final Color color;

  AppBarWidget({
    this.elevation,
    this.height = kToolbarHeight,
    this.back = true,
    this.content,
    this.radius = 20,
    this.color,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: back,
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
      ),
      title: Image.asset(
        'assets/images/logo-name.png',
        height: 45,
      ),
      flexibleSpace: content,
      elevation: elevation,
      centerTitle: true,
    );
  }
}
