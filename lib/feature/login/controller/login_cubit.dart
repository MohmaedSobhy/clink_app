import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:synchronized/synchronized.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  static LoginCubit? _loginCubit;
  static final Lock _lock = Lock();

  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) {
    if (_loginCubit == null) {
      _lock.synchronized(() {
        _loginCubit = BlocProvider.of(context);
      });
    }
    return _loginCubit!;
  }
}
