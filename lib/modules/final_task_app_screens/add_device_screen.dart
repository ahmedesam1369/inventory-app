import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/cubit.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/model/final_task/Task_user_model.dart';
import 'package:fristapp/shared/component/component.dart';
import 'package:fristapp/shared/styles/icon_broken.dart';
import 'package:intl/intl.dart';

class AddDeviceScreen extends StatelessWidget {
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

  DevicesModel devicemodel = DevicesModel(
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
    return BlocConsumer<FinalTaskCubit, TaskStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is TaskAddDeviceSuccessState) {
          FinalTaskCubit.get(context).DevicesList = [];
          FinalTaskCubit.get(context).GetAllDevices();
          showToast(
              msg: "Devive Added Successfuly", state: toastStates.SUCCESS);

          deviceNameController = TextEditingController();
          deviceTypeController = TextEditingController();
          deviceManufacutrerController = TextEditingController();
          deviceSerialNumberController = TextEditingController();
          devicePhysicalLocationController = TextEditingController();
          deviceOperatingStatusController = TextEditingController();
          deviceModelController = TextEditingController();
          deviceDepoartmentController = TextEditingController();
          devicenPowerRequirementsController = TextEditingController();
          deviceServiceRequirementsController = TextEditingController();
          devicePurchaseSupplierController = TextEditingController();
          deviceMaintanenceProviderController = TextEditingController();
          devicePreventiveMaintanencedateController = TextEditingController();
          deviceStockQuantitiesController = TextEditingController();
          deviceInventoryPerformedDateController = TextEditingController();
          devicePurchaseDateController = TextEditingController();

          FinalTaskCubit.get(context).changeBottomNav(0);
        } else if (state is TaskAddDeviceErrorsState)
          showToast(msg: state.Error.toString(), state: toastStates.ERROR);

        return Scaffold(
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
                          height: 10.0,
                        ),
                        //

                        defultFormField(
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
                          height: 15.0,
                        ),
                        ConditionalBuilder(
                          condition: State is! TaskAddUserLoadingState,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.only(
                              left: 50.0,
                              right: 50.0,
                            ),
                            child: defulteButton(
                                isUpperCase: false,
                                width: double.infinity,
                                height: 50,
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    devicemodel.deviceDepoartment =
                                        deviceDepoartmentController.text;
                                    devicemodel.deviceInventoryPerformedDate =
                                        deviceInventoryPerformedDateController
                                            .text;
                                    devicemodel.deviceMaintanenceProvider =
                                        deviceMaintanenceProviderController
                                            .text;
                                    devicemodel.deviceManufacutrer =
                                        deviceManufacutrerController.text;
                                    devicemodel.deviceModel =
                                        deviceModelController.text;
                                    devicemodel.deviceName =
                                        deviceNameController.text;
                                    devicemodel.deviceOperatingStatus =
                                        deviceOperatingStatusController.text;
                                    devicemodel.devicePhysicalLocation =
                                        devicePhysicalLocationController.text;
                                    devicemodel
                                            .devicePreventiveMaintanencedate =
                                        devicePreventiveMaintanencedateController
                                            .text;
                                    devicemodel.devicePurchaseDate =
                                        devicePurchaseDateController.text;
                                    devicemodel.devicePurchaseSupplier =
                                        devicePurchaseSupplierController.text;
                                    devicemodel.deviceSerialNumber =
                                        deviceSerialNumberController.text;
                                    devicemodel.deviceServiceRequirements =
                                        deviceServiceRequirementsController
                                            .text;
                                    devicemodel.deviceStockQuantities =
                                        deviceStockQuantitiesController.text;
                                    devicemodel.deviceType =
                                        deviceTypeController.text;
                                    devicemodel.devicenPowerRequirements =
                                        devicenPowerRequirementsController.text;

                                    FinalTaskCubit.get(context).deviceAdd(
                                        deviceName: devicemodel.deviceName,
                                        deviceType: devicemodel.deviceType,
                                        deviceManufacutrer:
                                            devicemodel.deviceManufacutrer,
                                        deviceSerialNumber:
                                            devicemodel.deviceSerialNumber,
                                        devicePhysicalLocation:
                                            devicemodel.devicePhysicalLocation,
                                        deviceOperatingStatus:
                                            devicemodel.deviceOperatingStatus,
                                        deviceModel: devicemodel.deviceModel,
                                        deviceDepoartment:
                                            devicemodel.deviceDepoartment,
                                        devicenPowerRequirements: devicemodel
                                            .devicenPowerRequirements,
                                        deviceServiceRequirements: devicemodel
                                            .deviceServiceRequirements,
                                        devicePurchaseSupplier: devicemodel
                                            .deviceServiceRequirements,
                                        deviceMaintanenceProvider: devicemodel
                                            .deviceMaintanenceProvider,
                                        deviceStockQuantities:
                                            devicemodel.deviceStockQuantities,
                                        devicePurchaseDate:
                                            devicemodel.devicePurchaseDate,
                                        devicePreventiveMaintanencedate:
                                            devicemodel
                                                .devicePreventiveMaintanencedate,
                                        deviceInventoryPerformedDate:
                                            devicemodel
                                                .deviceInventoryPerformedDate);
                                  }
                                },
                                text: 'ADD'),
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15.0,
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
