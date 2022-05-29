import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/cubit.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/shared/styles/icon_broken.dart';

class FinalTaskLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinalTaskCubit, TaskStates>(
      listener: (context, state) {
        // if (state is TaskNewPostState) {
        //   NavigetTo(
        //     context,
        //     NewPostScreen(),
        //   );
        // }
      },
      builder: (context, state) {
        var cubit = FinalTaskCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            // actions: [
            //   IconButton(
            //     icon: Icon(
            //       IconBroken.Notification,
            //     ),
            //     onPressed: () {},
            //   ),
            //   IconButton(
            //     icon: Icon(
            //       IconBroken.Search,
            //     ),
            //     onPressed: () {},
            //   ),
            // ],
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
                label: 'Add User',
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
