import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  //TextController
  final _emailController = TextEditingController();
  //reset password function
  Future ResetPass()async{
    try{
     await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
     return showDialog(context: context, builder: (_)=>AlertDialog(
       content: Text("The link send to your email successfuly check your email !"),
     ));
    }on FirebaseAuthException catch(e){
      print(e);
    return showDialog(context: context, 
      builder: (context)=> AlertDialog(
          content: Text(e.message.toString()),
        ));
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Write Your Email To Reset The Password !"),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15)),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.blue)),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: ResetPass, child: Text("Reset"))
        ],
      ),
    );
  }
}
