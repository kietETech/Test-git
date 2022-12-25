import 'package:flutter/material.dart';

class Context extends StatelessWidget {
  final IconData? addIcon;
  final AlignmentGeometry addAlignment;
  final String? addText;
  final double addSize;
  final Color? addColor;
  final FontWeight? addFontweight;
  final TextAlign? addTextAlign;
  final MainAxisAlignment addMainAlignment;
  final MainAxisSize addmainAxisSize;

  const Context(
      {super.key,
      required this.addMainAlignment,
      required this.addmainAxisSize,
      this.addIcon,
      required this.addAlignment,
      required this.addText,
      required this.addSize,
      required this.addColor,
      required this.addFontweight,
      required this.addTextAlign});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: addMainAlignment,
      mainAxisSize: addmainAxisSize,
      children: [
        Align(
          alignment: addAlignment,
          child: Text(
            addText!,
            style: TextStyle(
                fontSize: addSize, color: addColor, fontWeight: addFontweight),
            textAlign: addTextAlign,
          ),
        )
      ],
    );
  }
}
