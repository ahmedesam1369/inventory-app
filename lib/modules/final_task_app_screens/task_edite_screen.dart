import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/cubit.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/model/final_task/Task_user_model.dart';
import 'package:fristapp/shared/component/component.dart';
import 'package:fristapp/shared/styles/icon_broken.dart';
import 'package:intl/intl.dart';

class TaskEditeUserScraan extends StatelessWidget {

  late final int index;
  TaskEditeUserScraan(
    {
      required this.index,
    }
  ){}
  var formKey = GlobalKey<FormState> ();
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  var ageController = TextEditingController();
  var birthDayController = TextEditingController();

  late UsersModel modelAfterEdite = UsersModel(
    name: '',
    age: '',
    phone: '',
    birthDay: '',
    bio: '');
  
  @override
  Widget build(BuildContext context) {

  UsersModel modelBeforEdite = UsersModel(
    name: FinalTaskCubit.get(context).UsersList[index]['name'],
    age: FinalTaskCubit.get(context).UsersList[index]['age'],
    phone: FinalTaskCubit.get(context).UsersList[index]['phone'],
    birthDay: FinalTaskCubit.get(context).UsersList[index]['birthDay'],
    bio: FinalTaskCubit.get(context).UsersList[index]['bio']);

  nameController.text = modelBeforEdite.name;
  bioController.text = modelBeforEdite.bio;
  phoneController.text = modelBeforEdite.phone;
  ageController.text = modelBeforEdite.age;
  birthDayController.text = modelBeforEdite.birthDay;
    
    
    return BlocConsumer<FinalTaskCubit, TaskStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar:AppBar(
            actions: [
              defultTextButton(
                onPressed: (){
                  modelAfterEdite.name = nameController.text;
                  modelAfterEdite.age = ageController.text;
                  modelAfterEdite.bio = bioController.text;
                  modelAfterEdite.birthDay =birthDayController.text;
                  modelAfterEdite.phone = phoneController.text;
                  FinalTaskCubit.get(context).UpdateUser(
                    modelAfterEdite,
                    FinalTaskCubit.get(context).UsersList[index]['id']);
                },
                text: 'Update',
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  Container(
                    height: 190.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      4.0,
                                    ),
                                    topRight: Radius.circular(
                                      4.0,
                                    ),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage('https://image.freepik.com/free-photo/skeptical-woman-has-unsure-questioned-expression-points-fingers-sideways_273609-40770.jpg'), //: FileImage(coverImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ),
                                onPressed: () {
                                  //TaskCubit.get(context).getCoverImage();
                                },
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: NetworkImage('https://image.freepik.com/free-photo/skeptical-woman-has-unsure-questioned-expression-points-fingers-sideways_273609-40770.jpg'), 
                              ),
                            ),
                            IconButton(
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 16.0,
                                ),
                              ),
                              onPressed: () {
                                //TaskCubit.get(context).getProfileImage();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // if (TaskCubit.get(context).profileImage != null ||
                  //     TaskCubit.get(context).coverImage != null)
                    //Row(
                      //children: [
                        //if (TaskCubit.get(context).profileImage != null)
                          //Expanded(
                            //child: Column(
                              //children: [
                                //defulteButton(
                                  //function: () {
                                    // TaskCubit.get(context).uploadProfileImage(
                                    //   name: nameController.text,
                                    //   phone: phoneController.text,
                                    //   bio: bioController.text,
                                    // );
                                  //},
                                  //text: 'upload profile',
                                //),
                                // if (state is TaskUserUpdateLoadingState)
                                //   SizedBox(
                                //   height: 5.0,
                                // ),
                                // if (state is TaskUserUpdateLoadingState)
                                //   LinearProgressIndicator(),
                              //],
                            //),
                          //),
                  //       SizedBox(
                  //         width: 5.0,
                  //       ),
                  //       if (TaskCubit.get(context).coverImage != null)
                  //         Expanded(
                  //           child: Column(
                  //             children: [
                  //               defulteButton(
                  //                 function: ()
                  //                 {
                  //                   TaskCubit.get(context).uploadCoverImage(
                  //                     name: nameController.text,
                  //                     phone: phoneController.text,
                  //                     bio: bioController.text,
                  //                   );
                  //                 },
                  //                 text: 'upload cover',
                  //               ),
                  //               if (state is TaskUserUpdateLoadingState)
                  //                 SizedBox(
                  //                 height: 5.0,
                  //               ),
                  //               if (state is TaskUserUpdateLoadingState)
                  //                 LinearProgressIndicator(),
                  //             ],
                  //           ),
                  //         ),
                  //     ],
                  //   ),
                  // if (TaskCubit.get(context).profileImage != null ||
                  //     TaskCubit.get(context).coverImage != null)
                  //   SizedBox(
                  //     height: 20.0,
                  //   ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        defultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'name must not be empty';
                            }

                            return null;
                          },
                          lable: 'name',
                          prefix: IconBroken.User,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          controller: bioController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'bio must not be empty';
                            }
                            return null;
                          },
                          lable: 'bio',
                          prefix: IconBroken.Info_Circle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'phone number must not be empty';
                            }

                            return null;
                          },
                          lable: 'Phone',
                          prefix: IconBroken.Call,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          controller: ageController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'age must not be empty';
                            }

                            return null;
                          },
                          lable: 'Age',
                          prefix: IconBroken.User,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          controller: birthDayController,
                          type: TextInputType.datetime,
                          onTap: (){
                            showDatePicker(
                                  context: context, 
                                  initialDate: DateTime.now(), 
                                  firstDate: DateTime.now(), 
                                  lastDate: DateTime.parse('2022-09-30'),
                                  ).then((value)
                                  {
                                    birthDayController.text = DateFormat.yMMMd().format(value!);
                                    print(DateFormat.yMMMd().format(value));
                                  }
                                  );
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'birthDey must not be empty';
                            }
                            return null;
                          },
                          lable: 'birthDay',
                          prefix: IconBroken.Calendar,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                    // ConditionalBuilder(
                    //   condition: State is! TaskAddUserLoadingState, 
                    //   builder: (context)=> defulteButton(
                    //       isUpperCase: false,
                    //       width: 80.0,
                    //       function: (){
                    //         if(formKey.currentState!.validate()){
                    //           model.name = nameController.text;
                    //           model.bio = bioController.text;
                    //           model.phone = phoneController.text;
                    //           model.age = ageController.text;
                    //           model.birthDay = birthDayController.text;
                    //           print(model.bio);
                    //           print(bioController.text);
                    //           FinalTaskCubit.get(context).userAdd(
                    //             name: model.name, 
                    //             birthDay: model.birthDay, 
                    //             age: model.age, 
                    //             bio: model.bio,
                    //             phone: phoneController.text,
                    //             );
                    //         }
                    //     }, text: 'Add'
                    //     ),
                    //   fallback: (context)=> Center(child: CircularProgressIndicator()),
                    // ), 
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