import 'package:flutter/material.dart';

class Input_Field extends StatelessWidget {
  final String? addText;
  final TextEditingController addController;
  final bool addobcureText;
  final TextInputType addkeyboardType;
  final TextStyle? addTextStyle;
  final Widget? addIcon;
  final Widget? addsuffixIcon;

  const Input_Field(
      {super.key,
      required this.addText,
      required this.addController,
      required this.addobcureText,
      required this.addkeyboardType,
      required this.addTextStyle,
      required this.addIcon,
      required this.addsuffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: addController,
      obscureText: addobcureText,
      keyboardType: addkeyboardType,
      style: addTextStyle,
      decoration: InputDecoration(
          hintText: addText,
          labelText: addText,
          prefixIcon: addIcon,
          suffixIcon: addsuffixIcon,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE2E8F0), width: 1.5),
          ),
          border: const OutlineInputBorder()),
    );
  }
}
