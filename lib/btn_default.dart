import 'package:flutter/material.dart';

class BtnDefault extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const BtnDefault({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      highlightColor: Colors.blue,
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1))]),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
      onTap: onTap,
    );
  }
}
