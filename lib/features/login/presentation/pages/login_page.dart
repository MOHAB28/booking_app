import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/routes.dart';
import '../cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
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
            if (state.data.status != '0') {
              sl<SharedPreferences>()
                  .setString(isLoggedIn, state.data.authDataEntity.token)
                  .then(
                (value) {
                  if (value) {
                    token = sl<SharedPreferences>().getString(isLoggedIn);
                    Navigator.pushReplacementNamed(context, Routes.layoutPage);
                  }
                },
              );
            } else {
              FlushbarHelper.createError(message: state.data.titleEn)
                  .show(context);
            }
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
                  AppStrings.login.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSize.s20),
                Row(
                  children: [
                    Expanded(
                      child: FastAuthButton(
                        title: AppStrings.facebook.tr(),
                        color: ColorManager.bFacebook,
                        image: ImageAssets.facebook,
                      ),
                    ),
                    const SizedBox(width: AppSize.s10),
                    Expanded(
                      child: FastAuthButton(
                        title: AppStrings.twitter.tr(),
                        color: ColorManager.bTwitter,
                        image: ImageAssets.twitter,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s15),
                Center(
                  child: Text(
                    AppStrings.orLoginWithin.tr(),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                const SizedBox(height: AppSize.s15),
                CustomTextFormField(
                  controller: cubit.emailController,
                  keyboardType: TextInputType.emailAddress,
                  padding: EdgeInsets.zero,
                  errorText: cubit.errorEmail,
                  hintText: AppStrings.enterUrEmail.tr(),
                  onChanged: (txt) {},
                  titleText: AppStrings.urEmail.tr(),
                ),
                const SizedBox(height: AppSize.s12),
                CustomTextFormField(
                  controller: cubit.passwordController,
                  keyboardType: TextInputType.text,
                  padding: EdgeInsets.zero,
                  isObsecureText: true,
                  errorText: cubit.errorPassword,
                  hintText: AppStrings.enterPass.tr(),
                  onChanged: (txt) {},
                  titleText: AppStrings.password.tr(),
                ),
                const SizedBox(height: AppSize.s15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.forgotPass.tr(),
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
                    title: AppStrings.login.tr(),
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
