import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../injection_container.dart';
import '../../../../main.dart';
import '../../../login/presentation/widgets/custom_button_builder.dart';
import '../../../login/presentation/widgets/custom_text_field.dart';
import '../../../login/presentation/widgets/fast_auth_button.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

const String isRegistered = 'is regsiteres?';

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
            sl<SharedPreferences>()
                .setString(isRegistered, state.data.registerDataEntity.token)
                .then(
              (value) {
                if (value) {
                  token = sl<SharedPreferences>().getString(isRegistered);
                }
              },
            );
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
                  AppStrings.signUp,
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
                  controller: cubit.nameController,
                  keyboardType: TextInputType.text,
                  padding: EdgeInsets.zero,
                  errorText: cubit.errorName,
                  hintText: AppStrings.enterName,
                  onChanged: (txt) {},
                  titleText: AppStrings.name,
                ),
                const SizedBox(height: AppSize.s12),
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
                const SizedBox(height: AppSize.s12),
                CustomTextFormField(
                  controller: cubit.passwordComfirmController,
                  keyboardType: TextInputType.text,
                  padding: EdgeInsets.zero,
                  errorText: cubit.errorPasswordCon,
                  hintText: AppStrings.enterPassAgain,
                  onChanged: (txt) {},
                  titleText: AppStrings.password,
                ),
                const SizedBox(height: AppSize.s20),
                if (state is RegisterLoading) ...[
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ] else ...[
                  CustomButtonBuilder(
                    title: AppStrings.login,
                    onTap: () {
                      if (cubit.allValidation()) {
                        cubit.register(
                          RegisterInputCubit(
                            name: cubit.nameController.text.trim(),
                            email: cubit.emailController.text.trim(),
                            password: cubit.passwordController.text.trim(),
                            passwordConfirm: cubit.passwordComfirmController.text.trim(),
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
