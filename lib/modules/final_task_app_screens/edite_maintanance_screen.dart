import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/cubit.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/shared/component/component.dart';
import 'package:fristapp/shared/styles/icon_broken.dart';
import 'package:intl/intl.dart';

import '../../model/final_task/Task_user_model.dart';

class EditeMiantanenceScreen extends StatelessWidget {
  late final int index;
  EditeMiantanenceScreen({
    required this.index,
  }) {}

  var formKey = GlobalKey<FormState>();
  var MaintenanceTypController = TextEditingController();
  var workerController = TextEditingController();
  var startMaintenanceDateController = TextEditingController();
  var EndMaintenanceDateController = TextEditingController();
  var NoteController = TextEditingController();

  late MaintenanceModel modelAfterEdite = MaintenanceModel(
      MaintenanceTyp: "",
      startMaintenanceDate: "",
      EndMaintenanceDate: "",
      worker: "",
      Note: "");

  @override
  Widget build(BuildContext context) {
    late MaintenanceModel modelBeforeEdite = MaintenanceModel(
      MaintenanceTyp: FinalTaskCubit.get(context).maintanenceList[index]
          ['MaintenanceTyp'],
      startMaintenanceDate: FinalTaskCubit.get(context).maintanenceList[index]
          ['startMaintenanceDate'],
      EndMaintenanceDate: FinalTaskCubit.get(context).maintanenceList[index]
          ['EndMaintenanceDate'],
      worker: FinalTaskCubit.get(context).maintanenceList[index]['worker'],
      Note: FinalTaskCubit.get(context).maintanenceList[index]['Note'],
    );
    MaintenanceTypController.text = modelBeforeEdite.MaintenanceTyp;
    workerController.text = modelBeforeEdite.worker;
    startMaintenanceDateController.text = modelBeforeEdite.startMaintenanceDate;
    EndMaintenanceDateController.text = modelBeforeEdite.EndMaintenanceDate;
    NoteController.text = modelBeforeEdite.Note;

    return BlocConsumer<FinalTaskCubit, TaskStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Edite this Maintenance Record'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Form(
                  key: formKey,
                  child: Column(children: [
                    defultFormField(
                      controller: MaintenanceTypController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Maintenance Type must not be empty';
                        }
                        return null;
                      },
                      lable: 'Maintenance Type',
                      prefix: IconBroken.Swap,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    defultFormField(
                      controller: startMaintenanceDateController,
                      type: TextInputType.datetime,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.parse('2020-12-30'),
                          lastDate: DateTime.parse('2030-12-30'),
                        ).then((value) {
                          startMaintenanceDateController.text =
                              DateFormat.yMMMd().format(value!);
                          print(DateFormat.yMMMd().format(value));
                        });
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'start Maintenance Date must not be empty';
                        }
                        return null;
                      },
                      lable: 'start Maintenance Date',
                      prefix: IconBroken.Calendar,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    defultFormField(
                      controller: EndMaintenanceDateController,
                      type: TextInputType.datetime,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.parse('2020-12-30'),
                          lastDate: DateTime.parse('2030-12-30'),
                        ).then((value) {
                          EndMaintenanceDateController.text =
                              DateFormat.yMMMd().format(value!);
                          print(DateFormat.yMMMd().format(value));
                        });
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'End Maintenance Date must not be empty';
                        }
                        return null;
                      },
                      lable: 'End Maintenance Date',
                      prefix: IconBroken.Calendar,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    defultFormField(
                      controller: workerController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'this is must not be empty';
                        }

                        return null;
                      },
                      lable: 'By',
                      prefix: IconBroken.User1,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    defultFormField(
                      controller: NoteController,
                      type: TextInputType.multiline,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Note must not be empty';
                        }

                        return null;
                      },
                      lable: 'Note',
                      prefix: IconBroken.Paper,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defulteButton(
                        isUpperCase: false,
                        width: 100.0,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            modelAfterEdite.MaintenanceTyp =
                                MaintenanceTypController.text;
                            modelAfterEdite.startMaintenanceDate =
                                startMaintenanceDateController.text;
                            modelAfterEdite.EndMaintenanceDate =
                                EndMaintenanceDateController.text;
                            modelAfterEdite.worker = workerController.text;
                            modelAfterEdite.Note = NoteController.text;

                            FinalTaskCubit.get(context).Updatemaintenance(
                                modelAfterEdite,
                                FinalTaskCubit.get(context)
                                    .maintanenceList[index]['id']);
                            print(FinalTaskCubit.get(context)
                                .maintanenceList[index]['id']);
                            Navigator.pop(context);

                            // FinalTaskCubit.get(context)
                            //     .getAllmaintanenceHistory();
                          }
                        },
                        text: 'Save'),
                  ]),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
