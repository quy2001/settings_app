import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:setting_app/controller/setting/setting_controller.dart';

List<String> list = <String>[
  'Dọc',
  'Ngang',
];

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  SettingController? controller;
  String dropdownValue = list.first;

  @override
  void initState() {
    controller = Provider.of<SettingController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingController>(builder: (context, controller, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text('Settings'),
          centerTitle: true,
          actions: [
            Switch(
                value: controller.darkTheme,
                activeColor: Colors.purpleAccent,
                onChanged: (value) {
                  controller.changeTheme();
                })
          ],
        ),
        body: Center(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });

                if (dropdownValue == 'Ngang') {
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.landscapeLeft]);
                } else {
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitUp]);
                }
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
      );
    });
  }
}
