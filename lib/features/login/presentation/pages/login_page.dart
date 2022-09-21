import 'package:flutter/material.dart';
import 'package:phase3/core/resources/strings_manager.dart';
import 'package:phase3/features/login/presentation/widgets/my_button.dart';
import 'package:phase3/features/login/presentation/widgets/my_form_field.dart';
import 'package:phase3/features/login/presentation/widgets/my_text_button.dart';
import '../../../../core/resources/assets_manager.dart';


var emailController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  AppStrings.login,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: MyTextButton(
                          onPressed: (){},
                          text: AppStrings.facebook,
                          iconData: Icons.facebook,
                        ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: MyTextButton(
                        onPressed: (){},
                        text: AppStrings.google,
                        iconData: Icons.facebook,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: TextButton(
                      onPressed: (){},
                      child: const Text(
                        'or log in with email',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0
                        ),
                      ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                MyTextFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validator: (value)
                  {
                    if(value!.isNotEmpty){
                      return 'Please Enter Your Email';
                    }else{
                      return null;
                    }
                  },
                  label: 'Email Address',
                  prefix: const Icon(
                    Icons.email_outlined,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                MyTextFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  validator: (value)
                  {
                    if(value!.isNotEmpty){
                      return 'Please Enter Your Password';
                    }else{
                      return null;
                    }
                  },
                  label: 'Password',
                  prefix: const Icon(
                      Icons.lock_outline,
                  ),
                  suffix: const Icon(
                    Icons.visibility_outlined
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      AppStrings.forgetYourPassword,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                MyButton(
                    onPressed: (){},
                    text: AppStrings.login,
                    background: Colors.teal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
