import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/login/login_controller.dart';
import '../../utils/assets_utils.dart';
import 'login_widget/body_login.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginController? controller;

@override
  void initState() {
  controller = Provider.of<LoginController>(context, listen: false);
  controller!.getAccount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
      builder: (context, controller, chill) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(AssetUtils.backgroundLogin, fit: BoxFit.fill,),
                BodyLogin(
                  controller: controller,
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
