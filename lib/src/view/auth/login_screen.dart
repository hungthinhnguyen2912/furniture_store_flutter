import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_color.dart';
import 'package:office_furniture_store/src/view/auth/register_screen.dart';
import 'package:office_furniture_store/src/view/widget/text_field.dart';
import 'package:office_furniture_store/P.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTextField(
              controller: _emailController, hintext: "Email", obs: false),
          MyTextField(
              controller: _passController, hintext: "Password", obs: true),
          const SizedBox(height: 20,),
          Container(
            width: 410,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.lightOrange,
            ),
            child: GestureDetector(
              onTap: () => Login(_emailController.text, _passController.text),
              child: const Center(child: Text("Log in")),
            ),
          ),
          Row(
            children: [
              const Text("New user ?"),
              TextButton(onPressed: () {
                Get.to(const RegisterScreen());
              }, child:const Text("Register",))
            ],
          )
        ],
      ),
    );
  }
  void Login (String email,String password) async {
    await P.auth.signIn(email, password);
  }

}
