import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:setting_app/utils/theme.dart';

class SettingController extends ChangeNotifier{


  bool darkTheme = false;

  ThemeData themeData = lightMode;


  void changeTheme() async {
    darkTheme = !darkTheme;
    await saveConfig();
    notifyListeners();
  }

  void toggleTheme(){
    if(darkTheme == false){
      themeData = darkMode;
    }else{
      themeData = lightMode;
    }
    notifyListeners();
  }

  // lưu setting theme
  Future<void> saveConfig() async {
    config['THEME'] = darkTheme;
    await writeConfigFile(config);
  }

  //lấy cài đặt
  Future<void> getConfig() async{
    final loadedConfig = await readConfigFile();
    if(loadedConfig.isNotEmpty){
      darkTheme = bool.parse(config.entries.first.value);
    }else{
      //mặc định ban đầu là để light mode
      darkTheme = false;
      await saveConfig();
      toggleTheme();
    }
    notifyListeners();
  }

  final String filename = 'config.cfg';
  Map<String, dynamic> config = {};

  //Đọc file config
  Future<Map<String, dynamic>> readConfigFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$filename');
      final configString = await file.readAsString();
      final configLines = configString.split('\n');

      // final Map<String, dynamic> config = {};

      for (var line in configLines) {
        if (line.trim().isEmpty || line.startsWith('#')) {
          continue; // Bỏ qua dòng trống hoặc dòng comment
        }

        final parts = line.split('=');
        if (parts.length == 2) {
          final key = parts[0].trim();
          final value = parts[1].trim();
          config[key] = value;
        }
      }
      return config;
    } catch (e) {
      print("Error: $e");
      return {};
    }
  }

  //ghi file
  Future<void> writeConfigFile(Map<String, dynamic> config) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$filename');

    final configString = config.entries.map((entry) => '${entry.key}=${entry.value}').join('\n');

    await file.writeAsString(configString);
  }

}