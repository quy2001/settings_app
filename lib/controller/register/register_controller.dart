import 'package:flutter/material.dart';
import 'package:setting_app/database/name_tables.dart';
import 'package:sqflite/sqflite.dart';

import '../../database/database.dart';
import '../../models/account.dart';

class RegisterController extends ChangeNotifier {

  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController rePwdController = TextEditingController();

  DatabaseService service = DatabaseService.instance;

  void register({BuildContext? context}) async {
    try{
      Account account = Account(email: emailController.text,password: pwdController.text);
      final db = await service.database;
      await db.insert(NameTables.ACCOUNT, account.toMap(account),conflictAlgorithm: ConflictAlgorithm.replace);
      emailController.clear();
      pwdController.clear();
      rePwdController.clear();
      Navigator.pop(context!);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Đăng ký tài khoản thành công')));
    }catch (e){
      print('Error:$e');
    }
    notifyListeners();
  }

}