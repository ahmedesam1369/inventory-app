//import 'dart:js';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/cubit.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/modules/final_task_app_screens/task_edite_screen.dart';
import 'package:fristapp/shared/component/component.dart';
import 'package:fristapp/shared/component/constants.dart';
import 'package:fristapp/shared/styles/icon_broken.dart';

class TaskHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinalTaskCubit, TaskStates>(listener: (context, state) {
      if (state is TaskEditeUserSuccessState) {
        FinalTaskCubit.get(context).UsersList = [];
        FinalTaskCubit.get(context).getAllUsers();
      }
    }, builder: (context, state) {
      return ConditionalBuilder(
          condition: state is TaskGetAllUserLoadingState,
          builder: (context) => CircularProgressIndicator(),
          fallback: (context) {
            return UsersBiulder();
          });
    });
  }
}

Widget buildUserItem(context, index) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onLongPress: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red[400],
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Delete User',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              content: const Text('Are u sure u wanna delete this user'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    FinalTaskCubit.get(context).deleteUser(
                        FinalTaskCubit.get(context).UserList[index],
                        '${FinalTaskCubit.get(context).UserList[index]['id']}',
                        context);
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                "https://static.thenounproject.com/png/3057302-200.png",
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${FinalTaskCubit.get(context).UserList[index]['name']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blue,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'About -> ',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${FinalTaskCubit.get(context).UserList[index]['bio']}',
                        style: TextStyle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Phone -> ',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${FinalTaskCubit.get(context).UserList[index]['phone']}',
                        style: TextStyle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        '${FinalTaskCubit.get(context).UserList[index]['birthDay']}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
                onPressed: () {
                  NavigetTo(context, TaskEditeUserScraan(index: index));
                },
                icon: Icon(
                  IconBroken.Arrow___Right_2,
                  color: defultColor,
                )),
          ],
        ),
      ),
    );

Widget UsersBiulder() {
  return ConditionalBuilder(
    condition: true,
    builder: (context) => ListView.separated(
      itemBuilder: (context, index) => buildUserItem(context, index),
      separatorBuilder: (context, index) => MyDivider(),
      itemCount: FinalTaskCubit.get(context).UserList.length,
    ),
    fallback: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
          ),
          Text(
            'No Taskes Yet, Please Enter taskes',
          ),
        ],
      ),
    ),
  );
}
