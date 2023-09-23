import 'package:clinck_app/core/widgets/custom_button.dart';
import 'package:clinck_app/core/widgets/custome_header.dart';
import 'package:clinck_app/core/widgets/text_field.dart';
import 'package:clinck_app/feature/registration/controller/registration_cubit.dart';
import 'package:clinck_app/feature/registration/controller/registration_state.dart';
import 'package:clinck_app/feature/registration/view/hava_account_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/localization/app_string.dart';
import '../view/sized_box.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => RegistrationCubit(),
          child: BlocConsumer<RegistrationCubit, RegistrationState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height * 0.01,
                ),
                child: Form(
                  key: RegistrationCubit.get(context).formkey,
                  child: ListView(
                    children: [
                      const HeaderText(
                        decription: AppString.createAccount,
                        title: AppString.letStart,
                      ),
                      const SizedHight(),
                      CustomeTextFormField(
                        controller: RegistrationCubit.get(context).name,
                        hint: AppString.name,
                        textInputType: TextInputType.name,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter name";
                          }
                          return null;
                        },
                      ),
                      const SizedHight(),
                      CustomeTextFormField(
                        controller: RegistrationCubit.get(context).email,
                        hint: AppString.email,
                        textInputType: TextInputType.emailAddress,
                        onValidate: (value) {
                          if (RegistrationCubit.get(context).txt.isNotEmpty) {
                            return "Emial Already Taken";
                          }
                          if (value.toString().isEmpty) {
                            return "Enter email";
                          }
                          return null;
                        },
                      ),
                      const SizedHight(),
                      CustomeTextFormField(
                        controller: RegistrationCubit.get(context).phone,
                        hint: AppString.phone,
                        textInputType: TextInputType.phone,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter phone";
                          }
                          return null;
                        },
                      ),
                      const SizedHight(),
                      CustomeTextFormField(
                        controller: RegistrationCubit.get(context).password,
                        hint: AppString.password,
                        textInputType: TextInputType.visiblePassword,
                        obscure: true,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Enter password";
                          }
                          return null;
                        },
                      ),
                      const SizedHight(),
                      CustomeTextFormField(
                        controller:
                            RegistrationCubit.get(context).confirmPassword,
                        hint: AppString.confirm,
                        textInputType: TextInputType.visiblePassword,
                        obscure: true,
                        onValidate: (value) {
                          if (value.toString().isEmpty) {
                            return "Confirm Password";
                          }
                          if (value.toString() !=
                              RegistrationCubit.get(context)
                                  .password
                                  .text
                                  .toString()) {
                            return "Confrim Password should Match password";
                          }
                          return null;
                        },
                      ),
                      const SizedHight(),
                      const AlreadHaveAccount(),
                      const SizedHight(),
                      CustomButton(
                        onTap: () {
                          if (RegistrationCubit.get(context)
                              .formkey
                              .currentState!
                              .validate()) {
                            RegistrationCubit.get(context).signUp();
                          }
                        },
                        title: AppString.create,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
