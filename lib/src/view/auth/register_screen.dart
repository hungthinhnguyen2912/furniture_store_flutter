import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_color.dart';
import 'package:office_furniture_store/src/view/widget/text_field.dart';
import 'package:office_furniture_store/P.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _confirmPassController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTextField(
              controller: _nameController, hintext: "User name", obs: false),
          MyTextField(
              controller: _passController, hintext: "Email", obs: true),
          MyTextField(
              controller: _passController, hintext: "Password", obs: true),
          MyTextField(
              controller: _confirmPassController, hintext: "Confirm Password", obs: true),
          const SizedBox(height: 20,),
          Container(
            width: 410,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.lightOrange,
            ),
            child: GestureDetector(
              onTap: () => Register(_emailController.text, _passController.text, _nameController.text),
              child: const Center(child: Text("Register")),
            ),
          )
        ],
      ),
    );
  }
  void Register (String email,String password, String userName) async {
    await P.auth.signUp(email, password, userName);
  }

}
