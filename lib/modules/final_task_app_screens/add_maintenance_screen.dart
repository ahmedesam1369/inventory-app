import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/cubit.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/model/final_task/Task_user_model.dart';
import 'package:fristapp/modules/final_task_app_screens/maintenance_history_screen.dart';
import 'package:fristapp/shared/component/component.dart';
import 'package:fristapp/shared/styles/icon_broken.dart';
import 'package:intl/intl.dart';

class AddMaintananceScraan extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var MaintenanceTypController = TextEditingController();
  var workerController = TextEditingController();
  var startMaintenanceDateController = TextEditingController();
  var EndMaintenanceDateController = TextEditingController();
  var NoteController = TextEditingController();

  MaintenanceModel model = MaintenanceModel(
      MaintenanceTyp: "",
      startMaintenanceDate: "",
      EndMaintenanceDate: "",
      worker: "",
      Note: "");

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinalTaskCubit, TaskStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is maintanenceAddSuccessState) {
          FinalTaskCubit.get(context).maintanenceList = [];
          FinalTaskCubit.get(context).getAllmaintanenceHistory();
          showToast(msg: "Added Successfuly", state: toastStates.SUCCESS);
          MaintenanceTypController = TextEditingController();
          workerController = TextEditingController();
          startMaintenanceDateController = TextEditingController();
          EndMaintenanceDateController = TextEditingController();
          NoteController = TextEditingController();
        } else if (state is maintanenceAddErrorsState)
          showToast(msg: state.Error.toString(), state: toastStates.ERROR);
        return Scaffold(
          appBar: AppBar(
            title: Text('Add New Maintenance Record'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
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
                          prefix: IconBroken.User,
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
                          prefix: IconBroken.Call,
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
                          prefix: IconBroken.User,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ConditionalBuilder(
                          condition: State is! maintanenceAddLoadingState,
                          builder: (context) => defulteButton(
                              isUpperCase: false,
                              width: 80.0,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  model.MaintenanceTyp =
                                      MaintenanceTypController.text;
                                  model.startMaintenanceDate =
                                      startMaintenanceDateController.text;
                                  model.EndMaintenanceDate =
                                      EndMaintenanceDateController.text;
                                  model.worker = workerController.text;
                                  model.Note = NoteController.text;
                                  print(model.Note);
                                  FinalTaskCubit.get(context).MaintenanceAdd(
                                    MaintenanceTyp: model.MaintenanceTyp,
                                    startMaintenanceDate:
                                        model.startMaintenanceDate,
                                    EndMaintenanceDate:
                                        model.EndMaintenanceDate,
                                    worker: model.worker,
                                    Note: model.Note,
                                  );
                                  Navigator.pop(context);
                                }
                              },
                              text: 'ADD'),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
