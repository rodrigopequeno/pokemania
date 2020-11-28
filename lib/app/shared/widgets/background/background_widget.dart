import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

/// Classe responsável por construir um background personalizado.
class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final double _sigmaX = 2.0;
  final double _sigmaY = 2.0;
  final double _opacity = 0.1;

  BackgroundWidget({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var index = Random().nextInt(8);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background/$index.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
        child: Container(
          color: Colors.white.withOpacity(_opacity),
          child: child,
        ),
      ),
    );
  }
}
