import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting_app/controller/register/register_controller.dart';
import 'package:setting_app/controller/setting/setting_controller.dart';
import 'package:setting_app/utils/theme.dart';
import 'package:setting_app/views/login/login_view.dart';
import 'package:setting_app/views/setting/setting_view.dart';

import 'controller/login/login_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(create: (context) => LoginController()),
        ChangeNotifierProvider<RegisterController>(create: (context) => RegisterController()),
        ChangeNotifierProvider<SettingController>(create: (context) => SettingController())
      ],
      child: PageView()
    );
  }
}

class PageView extends StatefulWidget {
  const PageView({super.key});

  @override
  State<PageView> createState() => _PageViewState();
}

class _PageViewState extends State<PageView> {

  SettingController? controller;

  @override
  void initState() {
    controller = Provider.of<SettingController>(context, listen: false);
    controller!.getConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingController>(
        builder: (context,controller,child) {
          return MaterialApp(
            initialRoute: '/',
            routes: {
              '/setting_view': (context) => SettingView()
            },
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: controller.darkTheme ? darkMode : lightMode,
            home: LoginView(),
          );
        }
    );
  }
}

