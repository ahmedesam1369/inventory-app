import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fristapp/model/user_model.dart';
import 'package:fristapp/modules/register/cubit/states.dart';
import 'package:fristapp/shared/component/component.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      // print(value.user!.email);
      print(value.user!.uid);
      // userCreat(name: name, email: email, phone: phone, UId: value.user!.uid);
      showToast(msg: 'Register Successfuly', state: toastStates.SUCCESS);
      emit(RegisterSuccessState(value.user!.uid));
    }).catchError((Error) {
      emit(RegisterErrorState(Error.toString()));
    });
  }

  // void userCreat({
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required String UId,
  // }) {
  //   UserModel model = UserModel(
  //     email: email,
  //     name: name,
  //     phone: phone,
  //     uId: UId,
  //     // bio: 'write you bio ...',
  //     cover:
  //         'https://user-images.githubusercontent.com/79063735/154086657-c8aa4a69-5301-42bd-8221-15a57aa9c72e.jpg',
  //     image:
  //         'https://user-images.githubusercontent.com/79063735/154085050-2ec3aae2-6bc7-4c15-aa74-4bfddd01be11.jpg',
  //     isEmailVerfied: false,
  //   );
  //   FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(UId)
  //       .set(model.toMap())
  //       .then((value) {
  //     emit(CraetUserSuccessState());
  //   }).catchError((Error) {
  //     emit(CraetUserErrorState(Error.toString()));
  //   });
  // }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
}
