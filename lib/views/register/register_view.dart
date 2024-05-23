import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting_app/controller/register/register_controller.dart';
import 'package:setting_app/widgets/textfield_widget.dart';

import '../../widgets/button_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  RegisterController? controller;

  @override
  void initState() {
    controller = Provider.of<RegisterController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterController>(builder: (context, controller, child) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.95,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft:Radius.circular(16) )
        ),
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 5,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              ),
              SizedBox(
                height: 50,
              ),
              textFiledWidget(
                  txtController: controller.emailController,
                  hintText: 'Email',
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "Email không được rỗng";
                    }
                    return null;
                  }),
              SizedBox(
                height: 20,
              ),
              textFiledWidget(
                  txtController: controller.pwdController,
                  hintText: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "Mật không được rỗng";
                    }else if (value.length < 5) {
                      return "Mật khẩu tối thiểu 5 ký tự";
                    }
                    return null;
                  }),
              SizedBox(
                height: 20,
              ),
              textFiledWidget(
                  txtController: controller.rePwdController,
                  hintText: 'Confirm password',
                  obscureText: true,
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "Xác nhận mật khẩu không được rỗng";
                    }else if (value != controller.pwdController.text) {
                      return 'Mật khẩu nhập lại không đúng';
                    }
                    return null;
                  }),
              SizedBox(
                height: 50,
              ),
              buttonWidget(
                  textButton: 'Register',
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      controller.register(context: context);
                    }
                  }),
            ],
          ),
        ),
      );
    });
  }
}
