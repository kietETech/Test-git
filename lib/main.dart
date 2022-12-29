import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'btn_default.dart';
import 'input.dart';
import 'context.dart';
import 'show_error.dart';

enum BiometricType { noBio, touchID, faceID, allMethod } // create bien enum

void main() {
  runApp(
      const MyApp()); //Xac dinh phuong thuc chinh cua app, chuong trinh se chay den MyApp
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
  TextEditingController userNameCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _currenSize = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      children: [
        SizedBox(
          height: 24,
        ),
        _addImage('image/imageLogin.png'),
        SizedBox(
          height: 32,
        ),
        addTextFirst(),
        SizedBox(
          height: 12,
        ),
        addTextSecond(),
        SizedBox(
          height: 20,
        ),
        _userFeild(),
        SizedBox(
          height: 16,
        ),
        _passWordFeild(),
        SizedBox(
          height: 16,
        ),
        _errorText != null
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5), child: _showError())
            : SizedBox.shrink(),
        SizedBox(
          height: 10,
        ),
        addTextLast(),
        SizedBox(
          height: 10,
        ),
        _addButton('Đăng nhập', _currenSize),
        // SizedBox(
        //   height: 10,
        // ),
        biometricsVerify(BiometricType.allMethod),
      ],
    )));
  }

  Widget _addImage(var _newImage) {
    return Image.asset(_newImage);
  }

  Icon? errorIcon;
  Widget addTextFirst() {
    return Context(
      addmainAxisSize: MainAxisSize.min,
      addMainAlignment: MainAxisAlignment.center,
      addAlignment: Alignment.center,
      addText: 'Xin chào!',
      addSize: 30,
      addColor: Color(
        0xFF344872,
      ),
      addFontweight: FontWeight.bold,
      addTextAlign: TextAlign.center,
    );
  }

  Widget addTextSecond() {
    return Context(
      addmainAxisSize: MainAxisSize.min,
      addMainAlignment: MainAxisAlignment.center,
      addAlignment: Alignment.center,
      addText: 'Vui lòng đăng nhập để sử dụng ứng dụng',
      addSize: 14,
      addColor: Color(
        0xFFA2AEBD,
      ),
      addFontweight: null,
      addTextAlign: TextAlign.center,
    );
  }

  Widget addTextLast() {
    return Context(
      addmainAxisSize: MainAxisSize.min,
      addMainAlignment: MainAxisAlignment.start,
      addAlignment: Alignment.topLeft,
      addText: 'Quên mật khẩu?',
      addSize: 14,
      addColor: Color(
        0xFF7966FF,
      ),
      addFontweight: null,
      addTextAlign: TextAlign.start,
    );
  }

  Widget _showError() {
    return ShowError(
      title: _errorText,
      errorIcon: 'image/error.svg',
    );
  }

  bool _obscureTextUser = true;
  String _newIcon = 'image/user.svg';
  Widget _userFeild() {
    return Input_Field(
      addText: 'Tài khoản',
      addController: userNameCtr,
      addobcureText: false,
      addkeyboardType: TextInputType.text,
      addTextStyle: TextStyle(fontSize: 15),
      addIcon: SizedBox(
        height: 1,
        width: 1,
        child: SvgPicture.asset(
          _newIcon,
          height: 0.5,
          width: 0.5,
          fit: BoxFit.scaleDown,
        ),
      ),
      addsuffixIcon: userNameCtr.text != ''
          ? IconButton(
              onPressed: () {
                setState(() {
                  userNameCtr.text = '';
                });
              },
              icon: SvgPicture.asset('image/delete.svg'))
          : null,
    );
  }

  bool _obscureTextPassword = true;
  Widget _passWordFeild() {
    return Input_Field(
        addText: 'Mật khẩu',
        addController: passwordCtr,
        addobcureText: _obscureTextPassword,
        addkeyboardType: TextInputType.number,
        addTextStyle: TextStyle(fontSize: 15),
        addIcon: SvgPicture.asset(
          'image/lock.svg',
          fit: BoxFit.scaleDown,
        ),
        addsuffixIcon: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            passwordCtr.text != ''
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        passwordCtr.text = '';
                      });
                    },
                    icon: SvgPicture.asset(
                      'image/delete.svg',
                      fit: BoxFit.scaleDown,
                    ))
                : Icon(null),
            IconButton(
                onPressed: () {
                  setState(() {
                    _obscureTextPassword = !_obscureTextPassword;
                  });
                },
                icon: _obscureTextPassword
                    ? SvgPicture.asset(
                        'image/Hide.svg',
                        fit: BoxFit.scaleDown,
                      )
                    : Icon(
                        Icons.remove_red_eye,
                        size: 20,
                      )),
          ],
        ));
  }

  String? _errorText;
  String Abc = '';
  Widget _addButton(String _addTextBt, double _addSize) {
    return BtnDefault(
        title: 'Đăng nhập',
        onTap: () {
          setState(() {
            if (userNameCtr.text == 'abc' && passwordCtr.text == '123') {
              _errorText = null;
            } else if (userNameCtr.text == '') {
              errorIcon = Icon(Icons.abc_sharp);
              _errorText = 'Tên đăng nhập không được bỏ trống';
            } else if (passwordCtr.text == '') {
              errorIcon = Icon(Icons.abc_sharp);
              _errorText = 'Mật khẩu không được bỏ trống';
            } else if (userNameCtr.text != 'abc') {
              errorIcon = Icon(Icons.abc_sharp);
              _errorText = 'Tên đăng nhập không đúng';
            } else if (passwordCtr.text != '123') {
              errorIcon = Icon(Icons.abc_sharp);
              _errorText = 'Mật khẩu không đúng';
            } else {}
          });
        });
  }

  Widget biometricsVerify(final _addMethod) {
    switch (_addMethod) {
      case BiometricType.noBio:
        return Text('');
      case BiometricType.touchID:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/touchID.png',
              scale: 1.5,
            ),
          ],
        );
      case BiometricType.faceID:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('image/faceID.png'),
          ],
        );

      case BiometricType.allMethod:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/touchID.png',
              scale: 1.5,
            ),
            SizedBox(
              height: 100,
              width: 30.5,
            ),
            Image.asset(
              'image/faceID.png',
              scale: 1.5,
            ),
          ],
        );
    }

    return _addMethod;
  }
}
