import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/model/final_task/Task_user_model.dart';
import 'package:fristapp/modules/final_task_app_screens/task_setting_screen.dart';
import 'package:fristapp/shared/component/constants.dart';
import 'package:image_picker/image_picker.dart';

import '../../../modules/final_task_app_screens/task_add_user_screen.dart';
import '../../../modules/final_task_app_screens/task_home_screen.dart';

class FinalTaskCubit extends Cubit<TaskStates> {
  FinalTaskCubit() : super(TaskInitialState());

  static FinalTaskCubit get(context) => BlocProvider.of(context);

  void userAdd(
      {required String name,
      required String phone,
      required String birthDay,
      required String age,
      required String bio}) {
    UsersModel model = UsersModel(
      name: name,
      phone: phone,
      bio: bio,
      birthDay: birthDay,
      age: age,
      id: '',
    );
    FirebaseFirestore.instance
        .collection(Users)
        .add(model.toMap())
        .then((value) {
      model.id = value.id.toString();
      print(model.id);
      print(model.bio);
      FirebaseFirestore.instance.collection(Users).doc("${model.id}").update({
        'id': model.id,
      });
      UsersList.add(model.toMap());
      emit(TaskAddUserSuccessState());
    }).catchError((Error) {
      emit(TaskAddUserErrorsState(Error.toString()));
    });
  }

  late List<Map> UserList = [];

  void GetAllUsers() {
    FirebaseFirestore.instance
        .collection('TaskUsers')
        .snapshots()
        .listen((Event) {
      UserList = [];
      Event.docs.forEach((element) {
        UserList.add(element.data());
        print(UserList);
      });
      emit(Sucsses());
    });
  }

  late List<Map> UsersList = [];
  
  void getAllUsers() {
    emit(TaskGetUserLoadingState());
    FirebaseFirestore.instance.collection(Users).get().then((value) {
      value.docs.forEach((element) {
        UsersList.add(element.data());
      });
      emit(TaskGetAllUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(TaskGetAllUserErrorState(error));
    });
  }

  void UpdateUser(UsersModel model, String id) {
    emit(TaskEditeUserLoadingState());
    print(id);
    print(model.toMap());
    FirebaseFirestore.instance
        .collection(Users)
        .doc(id)
        .update(model.toMap())
        .then((value) {
      emit(TaskEditeUserSuccessState());
    }).catchError((onError) {
      emit(TaskEditeUserErrorState(onError));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    TaskHomeScreen(),
    TaskAddUserScraan(),
    TaskSettingScreen(),
  ];
  List<String> titles = [
    'Home',
    'Add User',
    'Settings',
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(TaskChangeBottomNavState());
  }

  File? image;
  var picker = ImagePicker();
  Future<void> getImage() async {
    final PickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (PickedFile != null) {
      image = File(PickedFile.path);
      emit(TaskImagePickedSuccessState());
    } else {
      print('No image Selected');
      emit(TaskImagePickedErrorState());
    }
  }

  void deleteUser(var value, var userId, BuildContext context) {
    emit(TaskDeleteUserLoadingState());
    FirebaseFirestore.instance.collection(Users).doc(userId).delete();
    UsersList.remove(value);
    emit(TaskDeleteUserSuccessState());
  }
}
