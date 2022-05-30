import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/cubit.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/model/final_task/Task_user_model.dart';
import 'package:fristapp/modules/final_task_app_screens/maintenance_history_screen.dart';
import 'package:fristapp/shared/component/component.dart';
import 'package:fristapp/shared/component/constants.dart';
import 'package:fristapp/shared/styles/icon_broken.dart';
import 'package:intl/intl.dart';

class TaskEditeUserScraan extends StatelessWidget {
  late final int index;
  TaskEditeUserScraan({
    required this.index,
  }) {}
  var formKey = GlobalKey<FormState>();
  var deviceNameController = TextEditingController();
  var deviceTypeController = TextEditingController();
  var deviceManufacutrerController = TextEditingController();
  var deviceSerialNumberController = TextEditingController();
  var devicePhysicalLocationController = TextEditingController();
  var deviceOperatingStatusController = TextEditingController();
  var deviceModelController = TextEditingController();
  var deviceDepoartmentController = TextEditingController();
  var devicenPowerRequirementsController = TextEditingController();
  var deviceServiceRequirementsController = TextEditingController();
  var devicePurchaseSupplierController = TextEditingController();
  var deviceMaintanenceProviderController = TextEditingController();
  var devicePreventiveMaintanencedateController = TextEditingController();
  var deviceStockQuantitiesController = TextEditingController();
  var deviceInventoryPerformedDateController = TextEditingController();
  var devicePurchaseDateController = TextEditingController();

  late DevicesModel devicemodelAfterEdite = DevicesModel(
      deviceDepoartment: '',
      deviceInventoryPerformedDate: '',
      deviceMaintanenceProvider: '',
      deviceManufacutrer: '',
      deviceModel: '',
      deviceName: '',
      deviceOperatingStatus: '',
      devicePhysicalLocation: '',
      deviceType: '',
      devicePreventiveMaintanencedate: '',
      devicePurchaseDate: '',
      devicePurchaseSupplier: '',
      deviceSerialNumber: '',
      deviceServiceRequirements: '',
      deviceStockQuantities: '',
      devicenPowerRequirements: '');

  @override
  Widget build(BuildContext context) {
    DevicesModel devicemodelBeforEdite = DevicesModel(
      deviceName: FinalTaskCubit.get(context).DevicesList[index]['deviceName'],
      deviceDepoartment: FinalTaskCubit.get(context).DevicesList[index]
          ['deviceDepoartment'],
      deviceInventoryPerformedDate: FinalTaskCubit.get(context)
          .DevicesList[index]['deviceInventoryPerformedDate'],
      deviceMaintanenceProvider: FinalTaskCubit.get(context).DevicesList[index]
          ['deviceMaintanenceProvider'],
      deviceManufacutrer: FinalTaskCubit.get(context).DevicesList[index]
          ['deviceManufacutrer'],
      deviceModel: FinalTaskCubit.get(context).DevicesList[index]
          ['deviceModel'],
      deviceOperatingStatus: FinalTaskCubit.get(context).DevicesList[index]
          ['deviceOperatingStatus'],
      devicePhysicalLocation: FinalTaskCubit.get(context).DevicesList[index]
          ['devicePhysicalLocation'],
      devicePreventiveMaintanencedate: FinalTaskCubit.get(context)
          .DevicesList[index]['devicePreventiveMaintanencedate'],
      devicePurchaseDate: FinalTaskCubit.get(context).DevicesList[index]
          ['devicePurchaseDate'],
      devicePurchaseSupplier: FinalTaskCubit.get(context).DevicesList[index]
          ['devicePurchaseSupplier'],
      deviceSerialNumber: FinalTaskCubit.get(context).DevicesList[index]
          ['deviceSerialNumber'],
      deviceServiceRequirements: FinalTaskCubit.get(context).DevicesList[index]
          ['deviceServiceRequirements'],
      deviceStockQuantities: FinalTaskCubit.get(context).DevicesList[index]
          ['deviceStockQuantities'],
      deviceType: FinalTaskCubit.get(context).DevicesList[index]['deviceType'],
      devicenPowerRequirements: FinalTaskCubit.get(context).DevicesList[index]
          ['devicenPowerRequirements'],
    );
    deviceDepoartmentController.text = devicemodelBeforEdite.deviceDepoartment;

    deviceInventoryPerformedDateController.text =
        devicemodelBeforEdite.deviceInventoryPerformedDate;

    deviceMaintanenceProviderController.text =
        devicemodelBeforEdite.deviceMaintanenceProvider;
    deviceManufacutrerController.text =
        devicemodelBeforEdite.deviceManufacutrer;
    deviceModelController.text = devicemodelBeforEdite.deviceModel;
    deviceNameController.text = devicemodelBeforEdite.deviceName;
    deviceOperatingStatusController.text =
        devicemodelBeforEdite.deviceOperatingStatus;
    devicePhysicalLocationController.text =
        devicemodelBeforEdite.devicePhysicalLocation;

    devicePreventiveMaintanencedateController.text =
        devicemodelBeforEdite.devicePreventiveMaintanencedate;
    devicePurchaseDateController.text =
        devicemodelBeforEdite.devicePurchaseDate;
    devicePurchaseSupplierController.text =
        devicemodelBeforEdite.devicePurchaseSupplier;
    deviceSerialNumberController.text =
        devicemodelBeforEdite.deviceSerialNumber;

    deviceServiceRequirementsController.text =
        devicemodelBeforEdite.deviceServiceRequirements;
    deviceStockQuantitiesController.text =
        devicemodelBeforEdite.deviceStockQuantities;
    deviceTypeController.text = devicemodelBeforEdite.deviceType;

    devicenPowerRequirementsController.text =
        devicemodelBeforEdite.devicenPowerRequirements;

    return BlocConsumer<FinalTaskCubit, TaskStates>(
      listener: (context, state) {
        if (state is TaskEditeDeviceSuccessState) {
          FinalTaskCubit.get(context).DevicesList = [];
          FinalTaskCubit.get(context).GetAllDevices();
          showToast(
              msg: "Devive Updated Successfuly", state: toastStates.SUCCESS);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = FinalTaskCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              Row(
                children: [
                  defultTextButton(
                    onPressed: () {
                      cubit.changedefaultformfieldClickable();
                    },
                    text: '  Edite   ',
                  ),
                ],
              ),
            ],
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
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 243, 240, 240),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  currentDeviceId = FinalTaskCubit.get(context)
                                      .DevicesList[index]['id'];
                                  FinalTaskCubit.get(context).maintanenceList =
                                      [];
                                  FinalTaskCubit.get(context)
                                      .getAllmaintanenceHistory();
                                  NavigetTo(context, maintenanceScreen());
                                  print(currentDeviceId);
                                },
                                child: Text(
                                  'show maintenance history'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: deviceNameController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty) {
                              print(value == null);
                              return 'device name must not be empty';
                            }

                            return null;
                          },
                          lable: 'Device Name',
                          prefix: IconBroken.Document,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: deviceOperatingStatusController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty) {
                              print(value == null);
                              return 'device name must not be empty';
                            }

                            return null;
                          },
                          lable: 'Operating Status',
                          prefix: IconBroken.Info_Circle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: devicePhysicalLocationController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty) {
                              print(value == null);
                              return 'device name must not be empty';
                            }

                            return null;
                          },
                          lable: 'Physical Location',
                          prefix: IconBroken.Location,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: deviceInventoryPerformedDateController,
                          type: TextInputType.datetime,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 1400)),
                              lastDate: DateTime.now(),
                            ).then((value) {
                              deviceInventoryPerformedDateController.text =
                                  DateFormat.yMMMd().format(value!);
                            });
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              print(value == null);
                              return 'device name must not be empty';
                            }

                            return null;
                          },
                          lable: 'Inventory Performed Date',
                          prefix: IconBroken.Calendar,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: deviceTypeController,
                          type: TextInputType.text,
                          validate: (value) {},
                          lable: 'Type',
                          prefix: IconBroken.Swap,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: deviceManufacutrerController,
                          type: TextInputType.text,
                          validate: (value) {},
                          lable: 'Manufacutrer',
                          prefix: IconBroken.More_Square,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: deviceSerialNumberController,
                          type: TextInputType.text,
                          validate: (value) {},
                          lable: 'Serial Number',
                          prefix: IconBroken.Paper_Negative,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: deviceModelController,
                          type: TextInputType.text,
                          validate: (value) {},
                          lable: 'Device Model',
                          prefix: IconBroken.Bag,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: deviceDepoartmentController,
                          type: TextInputType.text,
                          validate: (value) {},
                          lable: 'Department',
                          prefix: IconBroken.Category,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: deviceStockQuantitiesController,
                          type: TextInputType.text,
                          validate: (value) {},
                          lable: 'Stock Quantity',
                          prefix: IconBroken.Tick_Square,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: devicenPowerRequirementsController,
                          type: TextInputType.text,
                          validate: (value) {},
                          lable: 'Power Requirements',
                          prefix: IconBroken.Work,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: deviceServiceRequirementsController,
                          type: TextInputType.text,
                          validate: (value) {},
                          lable: 'Service Requirements',
                          prefix: IconBroken.Shield_Done,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: devicePurchaseSupplierController,
                          type: TextInputType.text,
                          validate: (value) {},
                          lable: 'Purchase Supplier',
                          prefix: IconBroken.Tick_Square,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: devicePurchaseDateController,
                          type: TextInputType.datetime,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 1400)),
                              lastDate: DateTime.now(),
                            ).then((value) {
                              devicePurchaseDateController.text =
                                  DateFormat.yMMMd().format(value!);
                            });
                          },
                          validate: (value) {},
                          lable: 'Purchase Date',
                          prefix: IconBroken.Calendar,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: deviceMaintanenceProviderController,
                          type: TextInputType.text,
                          validate: (value) {},
                          lable: 'Maintanence Provider',
                          prefix: IconBroken.Tick_Square,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defultFormField(
                          isCleckable: cubit.IsClickable,
                          controller: devicePreventiveMaintanencedateController,
                          type: TextInputType.datetime,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(Duration(days: 1400)),
                            ).then((value) {
                              devicePreventiveMaintanencedateController.text =
                                  DateFormat.yMMMd().format(value!);
                            });
                          },
                          validate: (value) {},
                          lable: 'Preventive Maintanence Date',
                          prefix: IconBroken.Calendar,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defulteButton(
                            isUpperCase: false,
                            width: 100.0,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                devicemodelAfterEdite.deviceDepoartment =
                                    deviceDepoartmentController.text;
                                devicemodelAfterEdite
                                        .deviceInventoryPerformedDate =
                                    deviceInventoryPerformedDateController.text;
                                devicemodelAfterEdite
                                        .deviceMaintanenceProvider =
                                    deviceMaintanenceProviderController.text;
                                devicemodelAfterEdite.deviceManufacutrer =
                                    deviceManufacutrerController.text;
                                devicemodelAfterEdite.deviceModel =
                                    deviceModelController.text;
                                devicemodelAfterEdite.deviceName =
                                    deviceNameController.text;
                                devicemodelAfterEdite.deviceOperatingStatus =
                                    deviceOperatingStatusController.text;
                                devicemodelAfterEdite.devicePhysicalLocation =
                                    devicePhysicalLocationController.text;
                                devicemodelAfterEdite
                                        .devicePreventiveMaintanencedate =
                                    devicePreventiveMaintanencedateController
                                        .text;
                                devicemodelAfterEdite.devicePurchaseDate =
                                    devicePurchaseDateController.text;
                                devicemodelAfterEdite.devicePurchaseSupplier =
                                    devicePurchaseSupplierController.text;
                                devicemodelAfterEdite.deviceSerialNumber =
                                    deviceSerialNumberController.text;
                                devicemodelAfterEdite
                                        .deviceServiceRequirements =
                                    deviceServiceRequirementsController.text;
                                devicemodelAfterEdite.deviceStockQuantities =
                                    deviceStockQuantitiesController.text;
                                devicemodelAfterEdite.deviceType =
                                    deviceTypeController.text;
                                devicemodelAfterEdite.devicenPowerRequirements =
                                    devicenPowerRequirementsController.text;

                                FinalTaskCubit.get(context).UpdateUser(
                                    devicemodelAfterEdite,
                                    FinalTaskCubit.get(context)
                                        .DevicesList[index]['id']);
                              }
                            },
                            text: 'Save'),
                        SizedBox(
                          height: 25.0,
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
