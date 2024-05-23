import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/login/login_controller.dart';
import '../../../utils/assets_utils.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/textfield_widget.dart';
import '../../register/register_view.dart';

class BodyLogin extends StatefulWidget {
   BodyLogin({super.key, this.controller});
  LoginController? controller;
  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return  Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(16),
      child: currentWidth < 500 ? Column(
        children: [
          Text(currentWidth.toString()),
          SizedBox(height: 20,),
          Lottie.asset(AssetUtils.lottieLogin,height: 280,width: double.infinity),
          SizedBox(height: 20,),
          Expanded(
            flex: 7,
              child: Column(
                children: [
                      textFiledWidget(
                          txtController: widget.controller!.emailController,hintText: 'Email'),
                      SizedBox(height: 20,),
                      textFiledWidget(txtController: widget.controller!.pwdController,hintText: 'Password',
                          obscureText: widget.controller!.isShowPwd,
                        haveIcon: true,
                        iconData:widget.controller!.isShowPwd ? Icon(Icons.close) : Icon(Icons.remove_red_eye),
                        onTapIcon: (){
                          widget.controller!.checkShowPwd();
                        }
                      ),
                      SizedBox(height: 40,),
                    buttonWidget(
                        textButton: 'Login',
                        onTap: (){
                          FocusScope.of(context).unfocus();
                          widget.controller!.onTapLogin(context: context);
                    }),
                ],
              )),
          Expanded(
            flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Không có tài khoản?'),
                  GestureDetector(
                    onTap: (){
                      widget.controller!.emailController.clear();
                      widget.controller!.pwdController.clear();
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) {
                            return RegisterView();
                          });
                    },
                      child: Text('Đăng ký',style: TextStyle(fontSize: 16,color: Colors.blue),))
                ],
              ))
        ],
      ) : Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            Lottie.asset(AssetUtils.lottieLogin,height: 280),
           SizedBox(width: 30,),
           Container(
            height: MediaQuery.of(context).size.width,
             width: 300,
             child: Column(
               children: [
                 SizedBox(height: 20,),
                 textFiledWidget(
                     txtController: widget.controller!.emailController,hintText: 'Email'),
                 SizedBox(height: 20,),
                 textFiledWidget(txtController: widget.controller!.pwdController,hintText: 'Password',
                     obscureText: widget.controller!.isShowPwd,
                     haveIcon: true,
                     iconData:widget.controller!.isShowPwd ? Icon(Icons.close) : Icon(Icons.remove_red_eye),
                     onTapIcon: (){
                       widget.controller!.checkShowPwd();
                     }
                 ),
                 SizedBox(height: 40,),
                 buttonWidget(
                     textButton: 'Login',
                     onTap: (){
                       FocusScope.of(context).unfocus();
                       widget.controller!.onTapLogin(context: context);
                     }),
                 SizedBox(height: 40,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Không có tài khoản?'),
                     GestureDetector(
                         onTap: (){
                           widget.controller!.emailController.clear();
                           widget.controller!.pwdController.clear();
                           showModalBottomSheet(
                               context: context,
                               isScrollControlled: true,
                               builder: (_) {
                                 return RegisterView();
                               });
                         },
                         child: Text('Đăng ký',style: TextStyle(fontSize: 16,color: Colors.blue),))
                   ],
                 )
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
