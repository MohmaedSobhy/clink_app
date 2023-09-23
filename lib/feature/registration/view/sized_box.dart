import 'package:flutter/material.dart';

class SizedHight extends StatelessWidget {
  const SizedHight({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.02,
    );
  }
}
