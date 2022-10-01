import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../injection_container.dart';
import '../../../../main.dart';
import '../../../login/presentation/pages/login_page.dart';
import '../../../login/presentation/widgets/custom_button_builder.dart';
import '../../../login/presentation/widgets/custom_text_field.dart';
import '../../../login/presentation/widgets/fast_auth_button.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    RegisterCubit.get(context).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
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
          var cubit = RegisterCubit.get(context);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.signUp.tr(),
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
                  controller: cubit.nameController,
                  keyboardType: TextInputType.text,
                  padding: EdgeInsets.zero,
                  errorText: cubit.errorName,
                  hintText: AppStrings.enterName.tr(),
                  onChanged: (txt) {},
                  titleText: AppStrings.name.tr(),
                ),
                const SizedBox(height: AppSize.s12),
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
                  errorText: cubit.errorPassword,
                  hintText: AppStrings.enterPass.tr(),
                  onChanged: (txt) {},
                  titleText: AppStrings.password.tr(),
                ),
                const SizedBox(height: AppSize.s12),
                CustomTextFormField(
                  controller: cubit.passwordComfirmController,
                  keyboardType: TextInputType.text,
                  padding: EdgeInsets.zero,
                  errorText: cubit.errorPasswordCon,
                  hintText: AppStrings.enterPassAgain.tr(),
                  onChanged: (txt) {},
                  titleText: AppStrings.password.tr(),
                ),
                const SizedBox(height: AppSize.s20),
                if (state is RegisterLoading) ...[
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ] else ...[
                  CustomButtonBuilder(
                    title: AppStrings.creatAccount.tr(),
                    onTap: () {
                      if (cubit.allValidation()) {
                        cubit.register(
                          RegisterInputCubit(
                            name: cubit.nameController.text.trim(),
                            email: cubit.emailController.text.trim(),
                            password: cubit.passwordController.text.trim(),
                            passwordConfirm:
                                cubit.passwordComfirmController.text.trim(),
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
    RegisterCubit.get(context).dispose();
    super.deactivate();
  }
}
