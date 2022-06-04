import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:peshang/Pages/Login_Page.dart';
import 'package:peshang/Pages/regester.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //show login page
  bool showloginpage = true;
  //togle pages
  void toglescreens(){
    setState(() {
      showloginpage = !showloginpage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showloginpage){
      return LoginPage(showRegisterPage: toglescreens);
    }else{
      return RegisterPage(showLoginPage: toglescreens);
    }
  }
}
