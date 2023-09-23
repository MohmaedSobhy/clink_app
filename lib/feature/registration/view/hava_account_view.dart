import 'package:clinck_app/core/localization/app_string.dart';
import 'package:flutter/material.dart';

class AlreadHaveAccount extends StatelessWidget {
  const AlreadHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          AppString.alreadyHaveAccount,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        MaterialButton(
          onPressed: () {},
          child: const Text(
            AppString.login,
          ),
        )
      ],
    );
  }
}
