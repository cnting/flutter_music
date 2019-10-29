import 'package:flutter/material.dart';
import 'package:flutter_music/config/application.dart';
import 'package:flutter_music/config/router/routes.dart';
import 'package:flutter_music/ui/widget/button.dart';
import 'package:flutter_music/ui/widget/provider_widget.dart';
import 'package:flutter_music/util/toast.dart';
import 'package:flutter_music/view_model/login_vm.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController;
  TextEditingController _pwdController;
  FocusNode _pwdFocusNode;

  @override
  void initState() {
    _phoneController = TextEditingController();
    _pwdController = TextEditingController();
    _pwdFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _pwdController.dispose();
    _pwdFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手机号登录'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: <Widget>[
              _phoneWidget(),
              _PwdWidget(_pwdController, _pwdFocusNode),
              _loginBtn()
            ],
          ),
        ),
      ),
    );
  }

  Widget _phoneWidget() {
    return TextFormField(
      controller: _phoneController,
      maxLines: 1,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(prefixText: '+86 | ', hintText: '请输入手机号'),
      onFieldSubmitted: (_) {
        ///密码输入框获取焦点
        FocusScope.of(context).requestFocus(_pwdFocusNode);
      },
      autofocus: true,
      autovalidate: false,
      validator: (String phone) {
        RegExp mobile = new RegExp(r"1[0-9]\d{9}$");
        if (mobile.hasMatch(phone)) {
          return null;
        } else {
          return "请输入正确的手机号";
        }
      },
    );
  }

  Widget _loginBtn() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ProviderWidget(
        model: LoginVM(Provider.of(context)),
        builder: (BuildContext context, LoginVM value, Widget child) {
          return PrimaryButton(
            child: value.isLoading()
                ? CircularProgressIndicator()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text('登录'),
                  ),
            onPressed: () {
              if (value.isLoading()) {
                return;
              }

              if (Form.of(context).validate()) {
                value.login(context, _phoneController.value.text,
                    _pwdController.value.text);
              }
            },
          );
        },
      ),
    );
  }
}

class _PwdWidget extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  _PwdWidget(this.controller, this.focusNode);

  @override
  _PwdWidgetState createState() => _PwdWidgetState();
}

class _PwdWidgetState extends State<_PwdWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: 1,
      textInputAction: TextInputAction.done,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: '请输入密码',
        suffix: GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(obscureText ? Icons.lock : Icons.lock_open),
          ),
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
      focusNode: widget.focusNode,
      validator: (String pwd) {
        if (pwd.isEmpty) {
          return '请输入密码';
        } else {
          return null;
        }
      },
    );
  }
}
