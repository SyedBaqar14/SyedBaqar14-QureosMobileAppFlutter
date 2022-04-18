

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qureos/config/constants.dart';
import 'package:flutter_qureos/repositories/authentication_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'authentication_state.dart';
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState(
    emailAddress: "",
    isLoginSuccess: false,
    isloading: false,
    isObsecure: true,
    googleSignInAccount: null
  ));

  final FToast fToast = FToast();
  final repository = AuthenticationRepository();

  final GoogleSignIn _googleSignIn =  GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController registerControllerName = TextEditingController();
  final TextEditingController registerControllerPassword = TextEditingController();

  signin() async {
    emit(state.copyWith(isloading: true));
    await repository.signin(email: emailController.text, password: passwordController.text).then((value) {
      if(value) {
        print("value: $value");
        emit(state.copyWith(isloading: false, isLoginSuccess: true));
        return true;
      } else {
        print("value: $value");
        emit(state.copyWith(isloading: false, isLoginSuccess: false));
        return false;
      }
    });
  }

  register() async {
    emit(state.copyWith(isloading: true));
    repository.register(email: registerControllerName.text, password: registerControllerPassword.text).then((value) {
      if(value) {
        print("value: $value");
        emit(state.copyWith(isloading: false, isLoginSuccess: true));
      } else {
        print("value: $value");
        emit(state.copyWith(isloading: false, isLoginSuccess: false));
      }
    });
  }

  setEmail({required String emailAddress}) {
    emit(state.copyWith(emailAddress: emailAddress));
  }

  showToast({required String message}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 12.0, height: 55,
          ),
          Expanded(
            child: Center(
              child: Text(
                message,
                style: TextStyle(color: kUniversalColor),
              ),
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
    );
  }

  setIsObscure({required bool isObsecure}) {
    emit(state.copyWith(isObsecure: isObsecure));
  }

  Future<bool> handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn().then((value) {
        emit(state.copyWith(googleSignInAccount: value));
        print("_googleSignIned: ${value!.displayName}");
        if (kDebugMode) {
          print("_googleSignIned: ${value?.displayName}");
        }
      });
      emit(state.copyWith(isLoginSuccess: true));
      return true;
    } catch (error) {
      if (kDebugMode) {
        print("error: $error");
      }
      emit(state.copyWith(isLoginSuccess: false));
      return false;
    }
  }

}