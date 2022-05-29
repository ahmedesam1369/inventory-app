import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppIntailState());
  AppCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;
   void ChangeIndex(index){
    currentIndex =index;
    emit(AppChangeBottomNavBarState());
  }

   bool isBottomSheetShown = false;
  bool isiconadd =true;

  void ChangeBottomSheetState({
    required bool isiconadd,
  })
  {
    isBottomSheetShown = isiconadd;
    emit(AppChangeBottomSheetState());
  }
  
  bool IsDark =false;
  void ChangeAppMode(){
    IsDark =!IsDark;
    emit(AppChangeModeState());
  }
}