import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../database/database.dart';
import '../../database/name_tables.dart';
import '../../models/account.dart';
import '../../views/setting/setting_view.dart';

class LoginController extends ChangeNotifier{


  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  DatabaseService service = DatabaseService.instance;
  List<Account>? listAccount;

  Future<void> getAccount() async{
    try{
      final db = await service.database;
      final data = await db.query(NameTables.ACCOUNT);
      listAccount = data
          .map(
            (e) => Account(
          id: e["id"] as int,
          email: e["email"] as String,
          password: e["password"] as String,
        ),
      ).toList();
    }catch (e){
      print('Error: $e');
    }
    notifyListeners();
  }

  Future<void> onTapLogin({BuildContext? context}) async {
    await getAccount();
    bool isCheckLogin = false;
    if(listAccount!.isNotEmpty){
      for(var user in listAccount!){
        if(emailController.text == user.email && pwdController.text == user.password){
          Navigator.push(context!,CupertinoPageRoute(builder: (_)=>SettingView()));
          isCheckLogin = true;
          ScaffoldMessenger.of(context!)
              .showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text('Đăng nhập thành công')));
          break;
        }
      }
     if(isCheckLogin == false){
       ScaffoldMessenger.of(context!)
           .showSnackBar(SnackBar(
            backgroundColor: Colors.red,
           content: Text('Sai thông tin tài khoản!')));
     }
    }
    notifyListeners();
  }

  bool isShowPwd = true;

  void checkShowPwd(){
    isShowPwd = !isShowPwd;
    notifyListeners();
  }
}