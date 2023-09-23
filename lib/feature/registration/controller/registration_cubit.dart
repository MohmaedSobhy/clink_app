import 'package:clinck_app/core/api/api.dart';
import 'package:clinck_app/core/api/api_keys.dart';
import 'package:clinck_app/core/api/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';
import 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  RegistrationCubit() : super(RegistrationInitial());
  String txt = "";
  static final _lock = Lock();

  static RegistrationCubit? _registrationCubit;

  static RegistrationCubit get(context) {
    if (_registrationCubit == null) {
      _lock.synchronized(() {
        _registrationCubit = BlocProvider.of(context);
      });
    }
    return _registrationCubit!;
  }

  void signUp() {
    APIManager.postMethod(baseUrl: EndPoints.signUp, body: {
      APIKey.name: name.text.toString(),
      APIKey.email: email.text.toString(),
      APIKey.phone: phone.text.toString(),
      APIKey.password: password.text.toString(),
      APIKey.confirmPassword: confirmPassword.text.toString(),
      APIKey.gender: "0",
    }).then((response) {
      if (response.statusCode == 200) {
      } else {
        emit(RegistrationFailed());
      }
    }).then((error) {});
  }
}
