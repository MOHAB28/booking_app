import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/routes.dart';
import '../cubit/login_cubit.dart';
import '../../../../main.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../injection_container.dart';
import '../widgets/custom_button_builder.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/fast_auth_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

const String isLoggedIn = 'is Logged in ?';

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    LoginCubit.get(context).init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            sl<SharedPreferences>()
                .setString(isLoggedIn, state.data.loginDataEntity.token)
                .then(
              (value) {
                if (value) {
                  token = sl<SharedPreferences>().getString(isLoggedIn);
                  Navigator.pushReplacementNamed(context, Routes.layoutPage);
                }
              },
            );
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.login,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSize.s20),
                Row(
                  children: const [
                    Expanded(
                      child: FastAuthButton(
                        title: AppStrings.facebook,
                        color: ColorManager.bFacebook,
                        image: ImageAssets.facebook,
                      ),
                    ),
                    SizedBox(width: AppSize.s10),
                    Expanded(
                      child: FastAuthButton(
                        title: AppStrings.twitter,
                        color: ColorManager.bTwitter,
                        image: ImageAssets.twitter,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s15),
                Center(
                  child: Text(
                    AppStrings.orLoginWithin,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                const SizedBox(height: AppSize.s15),
                CustomTextFormField(
                  controller: cubit.emailController,
                  keyboardType: TextInputType.emailAddress,
                  padding: EdgeInsets.zero,
                  errorText: cubit.errorEmail,
                  hintText: AppStrings.enterUrEmail,
                  onChanged: (txt) {},
                  titleText: AppStrings.urEmail,
                ),
                const SizedBox(height: AppSize.s12),
                CustomTextFormField(
                  controller: cubit.passwordController,
                  keyboardType: TextInputType.text,
                  padding: EdgeInsets.zero,
                  errorText: cubit.errorPassword,
                  hintText: AppStrings.enterPass,
                  onChanged: (txt) {},
                  titleText: AppStrings.password,
                ),
                const SizedBox(height: AppSize.s15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.forgotPass,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s20),
                if (state is LoginLoading) ...[
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ] else ...[
                  CustomButtonBuilder(
                    title: AppStrings.login,
                    onTap: () {
                      if (cubit.allValidation()) {
                        BlocProvider.of<LoginCubit>(context).login(
                          LoginInputCubit(
                            email: cubit.emailController.text.trim(),
                            password: cubit.passwordController.text.trim(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
  @override
  void deactivate() {
    LoginCubit.get(context).dispose();
    super.deactivate();
  }
}
