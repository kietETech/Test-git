import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ShowError extends StatelessWidget {
  final String? title;
  final String? errorIcon;
  const ShowError({super.key, required this.title, required this.errorIcon});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SvgPicture.asset(errorIcon!),
      SizedBox(
        width: 8.7,
      ),
      Text(title!),
    ]);
  }
}
