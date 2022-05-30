import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/cubit.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/shared/styles/icon_broken.dart';

class FinalTaskLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinalTaskCubit, TaskStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FinalTaskCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Add_User,
                ),
                label: 'Add Device',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Setting,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
