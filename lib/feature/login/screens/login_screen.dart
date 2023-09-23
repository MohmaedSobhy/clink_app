import 'package:clinck_app/core/widgets/custome_header.dart';
import 'package:clinck_app/core/widgets/text_field.dart';
import 'package:clinck_app/feature/login/controller/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localization/app_string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ListView(
                children: [
                  const HeaderText(
                    title: AppString.welcome,
                    decription: AppString.loginDescription,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  CustomeTextFormField(
                    controller: LoginCubit.get(context).email,
                    hint: AppString.email,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  CustomeTextFormField(
                    controller: LoginCubit.get(context).password,
                    hint: AppString.password,
                    textInputType: TextInputType.emailAddress,
                    obscure: true,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
