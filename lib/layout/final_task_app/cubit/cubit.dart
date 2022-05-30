import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/states.dart';
import 'package:fristapp/model/final_task/Task_user_model.dart';
import 'package:fristapp/modules/final_task_app_screens/setting_screen.dart';
import 'package:fristapp/shared/component/constants.dart';
import '../../../modules/final_task_app_screens/add_device_screen.dart';
import '../../../modules/final_task_app_screens/home_screen.dart';

class FinalTaskCubit extends Cubit<TaskStates> {
  FinalTaskCubit() : super(TaskInitialState());

  static FinalTaskCubit get(context) => BlocProvider.of(context);

  void deviceAdd({
    required String deviceName,
    required String deviceType,
    required String deviceManufacutrer,
    required String deviceSerialNumber,
    required String devicePhysicalLocation,
    required String deviceOperatingStatus,
    required String deviceModel,
    required String deviceDepoartment,
    required String devicenPowerRequirements,
    required String deviceServiceRequirements,
    required String devicePurchaseSupplier,
    required String deviceMaintanenceProvider,
    required String deviceStockQuantities,
    required String devicePurchaseDate,
    required String devicePreventiveMaintanencedate,
    required String deviceInventoryPerformedDate,
  }) {
    DevicesModel devicemodel = DevicesModel(
        deviceDepoartment: deviceDepoartment,
        deviceInventoryPerformedDate: deviceInventoryPerformedDate,
        deviceMaintanenceProvider: deviceMaintanenceProvider,
        deviceManufacutrer: deviceManufacutrer,
        deviceModel: deviceModel,
        deviceName: deviceName,
        deviceOperatingStatus: deviceOperatingStatus,
        devicePhysicalLocation: devicePhysicalLocation,
        deviceType: deviceType,
        devicePreventiveMaintanencedate: devicePreventiveMaintanencedate,
        devicePurchaseDate: devicePurchaseDate,
        devicePurchaseSupplier: devicePurchaseSupplier,
        deviceSerialNumber: deviceSerialNumber,
        deviceServiceRequirements: deviceServiceRequirements,
        deviceStockQuantities: deviceStockQuantities,
        devicenPowerRequirements: devicenPowerRequirements);
    FirebaseFirestore.instance
        .collection(Users)
        .add(devicemodel.toMap())
        .then((value) {
      devicemodel.id = value.id.toString();
      print(devicemodel.id);
      print(devicemodel.deviceName);

      FirebaseFirestore.instance
          .collection(Users)
          .doc("${devicemodel.id}")
          .update({
        'id': devicemodel.id,
      });
      DevicesList.add(devicemodel.toMap());
      emit(TaskAddDeviceSuccessState());
    }).catchError((Error) {
      emit(TaskAddDeviceErrorsState(Error.toString()));
    });
  }

  late List<Map> DevicesList = [];
  void GetAllDevices() {
    FirebaseFirestore.instance
        .collection('TaskUsers')
        .snapshots()
        .listen((Event) {
      DevicesList = [];
      Event.docs.forEach((element) {
        DevicesList.add(element.data());
      });
      emit(GetAllDevicesSuccessState());
    });
  }

  void UpdateUser(DevicesModel model, String id) {
    emit(TaskEditeDeviceLoadingState());
    print(id);
    print(model.toMap());
    FirebaseFirestore.instance
        .collection(Users)
        .doc(id)
        .update(model.toMap())
        .then((value) {
      emit(TaskEditeDeviceSuccessState());
    }).catchError((onError) {
      emit(TaskEditeDeviceErrorState(onError));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    TaskHomeScreen(),
    AddDeviceScreen(),
    TaskSettingScreen(),
  ];
  List<String> titles = [
    'Inventory ',
    'Add New Device',
    'Settings',
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(TaskChangeBottomNavState());
  }

  bool IsClickable = false;
  bool ShowSaveButton = false;
  void changedefaultformfieldClickable() {
    IsClickable = true;
    ShowSaveButton = true;
    emit(changedefaultformfieldClickableState());
  }

  void deleteUser(var value, var userId, BuildContext context) {
    emit(TaskDeleteDeviceLoadingState());
    FirebaseFirestore.instance.collection(Users).doc(userId).delete();
    DevicesList.remove(value);
    emit(TaskDeleteDeviceSuccessState());
  }

  void MaintenanceAdd(
      {required String MaintenanceTyp,
      required String startMaintenanceDate,
      required String EndMaintenanceDate,
      required String worker,
      required String Note}) {
    MaintenanceModel model = MaintenanceModel(
      MaintenanceTyp: MaintenanceTyp,
      startMaintenanceDate: startMaintenanceDate,
      Note: Note,
      EndMaintenanceDate: EndMaintenanceDate,
      worker: worker,
      id: '',
    );
    FirebaseFirestore.instance
        .collection(Users)
        .doc(currentDeviceId)
        .collection('Mintenance history')
        .add(model.toMap())
        .then((value) {
      model.id = value.id.toString();
      print(model.id);
      FirebaseFirestore.instance
          .collection(Users)
          .doc(currentDeviceId)
          .collection('Mintenance history')
          .doc("${model.id}")
          .update({
        'id': model.id,
      });
      emit(maintanenceAddSuccessState());
    }).catchError((Error) {
      emit(maintanenceAddErrorsState(Error.toString()));
    });
  }

//
  void getAllmaintanenceHistory() {
    FirebaseFirestore.instance
        .collection('TaskUsers')
        .doc(currentDeviceId)
        .collection('Mintenance history')
        .snapshots()
        .listen((Event) {
      maintanenceList = [];
      Event.docs.forEach((element) {
        maintanenceList.add(element.data());
      });
      emit(GetAllMaintenanceHistorySuccessState());
    });
  }

//
  late List<Map> maintanenceList = [];

  void deletemaintenance(var value, var maintenanceId, BuildContext context) {
    emit(TaskDeleteDeviceLoadingState());
    FirebaseFirestore.instance
        .collection(Users)
        .doc(currentDeviceId)
        .collection('Mintenance history')
        .doc(maintenanceId)
        .delete()
        .then((valuee) {
      emit(maintanenceDeleteSuccessState());
    });
  }

  void Updatemaintenance(MaintenanceModel model, String id) {
    emit(MaintenanceEditeLoadingState());
    FirebaseFirestore.instance
        .collection(Users)
        .doc(currentDeviceId)
        .collection('Mintenance history')
        .doc(id)
        .update(model.toMap())
        .then((value) {
      model.id = id;
      FirebaseFirestore.instance
          .collection(Users)
          .doc(currentDeviceId)
          .collection('Mintenance history')
          .doc("${model.id}")
          .update({
        'id': model.id,
      });

      emit(MaintenanceEditeSuccessState());
    }).catchError((onError) {
      emit(MaintenanceEditeErrorState(onError));
    });
  }
}
