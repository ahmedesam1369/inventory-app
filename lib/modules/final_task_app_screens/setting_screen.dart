import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/final_task_app/cubit/cubit.dart';
import '../../layout/final_task_app/cubit/states.dart';
import '../../shared/component/component.dart';
import '../../shared/network/local/cache_helper.dart';
import '../login/login_screen.dart';

class TaskSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinalTaskCubit, TaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: defulteButton(
                      text: 'Sign Out',
                      isUpperCase: false,
                      width: 200.0,
                      function: () async {
                        await FirebaseAuth.instance.signOut();
                        NavidetAndFinish(context, LoginScreen());
                        CachHelper.removeData(key: 'uId');
                        FinalTaskCubit.get(context).currentIndex = 0;
                      }),
                ),
              ],
            ),
          );
        });
  }
}
