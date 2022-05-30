import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/modules/login/cubit/states.dart';
import 'package:fristapp/shared/network/end_points.dart';
import 'package:fristapp/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  void UserLogin({required String email, required String passWord}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: passWord,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((Error) {
      emit(LoginErrorState(Error.toString()));
    });
  }

  

  bool IsPassward = true;
  IconData suffix = Icons.visibility_off_outlined;
  void changePasswordVisibility() {
    IsPassward = !IsPassward;
    suffix = IsPassward
        ? Icons.visibility_off_outlined
        : Icons.remove_red_eye_outlined;
    emit(ChangePasswordVisibilityState());
  }
}