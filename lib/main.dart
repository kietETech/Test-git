import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double _currenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          _addImage('image/imageLogin.png', _currenSize),
          addText('Xin chào',30),
          SizedBox(height: 10,),
          addText('Vui lòng đăng nhập để sử dụng ứng dụng',15),
        ],
      ),
    );
  }

  Widget _addImage(var _newImage, double _range) {
    return Column(
      children: [
        Container(
          height: _range,
          width: _range,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_newImage),
            ),
          ),
        ),
      ],
    );
  }

  Widget addText(String _text,double _addSize)
  {
    return Text(_text,style: TextStyle(fontSize: _addSize));
  }
}
