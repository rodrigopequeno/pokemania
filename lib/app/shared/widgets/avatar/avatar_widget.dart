import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Classe responsável por construir um avatar.
class AvatarWidget extends StatelessWidget {
  final String image;
  final double width;
  final Color cor;
  final String imageDefault;

  const AvatarWidget(
      {Key key,
      this.image,
      this.width = 40,
      this.cor,
      this.imageDefault = 'red'})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: image != null && image.isNotEmpty,
      replacement: Image.asset(
        'assets/images/pokebola/$imageDefault.png',
        width: width - 10,
        color: cor,
      ),
      child: Center(
        child: SvgPicture.network(
          image ?? "",
          placeholderBuilder: (context) => Center(
            child: CircularProgressIndicator(),
          ),
          width: width,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
