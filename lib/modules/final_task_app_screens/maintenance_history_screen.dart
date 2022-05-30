import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/modules/final_task_app_screens/add_maintenance_screen.dart';
import 'package:fristapp/modules/final_task_app_screens/edite_maintanance_screen.dart';
import 'package:fristapp/shared/component/component.dart';
import 'package:fristapp/shared/component/constants.dart';
import 'package:fristapp/shared/styles/icon_broken.dart';
import 'package:intl/intl.dart';

import '../../layout/final_task_app/cubit/cubit.dart';

class maintenanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinalTaskCubit, TaskStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Maintenance History'),
          ),
          body: MaintenanDataBiulder(),
          
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              NavigetTo(context, AddMaintananceScraan());
            },
            child: Icon(
              Icons.add,
            ),
            elevation: 20.0,
          ),
        );
      },
    );
  }
}

Widget buildMaintenanDataItem(context, index) => Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  //'${FinalTaskCubit.get(context).UserList[index]['name']}',
                  'Maintenance Type : ',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Text(
                    '${FinalTaskCubit.get(context).maintanenceList[index]['MaintenanceTyp']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text(
                  'from : ',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Text(
                    '${FinalTaskCubit.get(context).maintanenceList[index]['startMaintenanceDate']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text(
                  'to : ',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Text(
                    '${FinalTaskCubit.get(context).maintanenceList[index]['EndMaintenanceDate']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text(
                  'By : ',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Text(
                    '${FinalTaskCubit.get(context).maintanenceList[index]['worker']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text(
                  'Note : ',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Text(
                    '${FinalTaskCubit.get(context).maintanenceList[index]['Note']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                defulteButton(
                  height: 30.0,
                  function: () {
                    NavigetTo(context, EditeMiantanenceScreen(index: index));
                  },
                  text: 'edite',
                  width: 100.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                defulteButton(
                  height: 30.0,
                  function: () {
                    print(currentDeviceId);
                    print(FinalTaskCubit.get(context).maintanenceList[index]
                        ['id']);
                    FinalTaskCubit.get(context).deletemaintenance(
                        FinalTaskCubit.get(context).maintanenceList[index],
                        '${FinalTaskCubit.get(context).maintanenceList[index]['id']}',
                        context);
                    FinalTaskCubit.get(context).maintanenceList = [];
                    FinalTaskCubit.get(context).getAllmaintanenceHistory();
                  },
                  text: 'delete',
                  width: 100.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget MaintenanDataBiulder() {
  return ConditionalBuilder(
    condition: true,
    builder: (context) => ListView.separated(
      itemBuilder: (context, index) => buildMaintenanDataItem(context, index),
      separatorBuilder: (context, index) => SizedBox(
        height: 5,
      ),
      itemCount: FinalTaskCubit.get(context).maintanenceList.length,
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
