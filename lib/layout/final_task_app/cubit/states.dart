abstract class TaskStates {}

class TaskInitialState extends TaskStates {}

class TaskAddUserLoadingState extends TaskStates {}

class TaskAddDeviceSuccessState extends TaskStates {}

class TaskAddDeviceErrorsState extends TaskStates {
  late final String Error;
  TaskAddDeviceErrorsState(this.Error);
}

class GetAllDevicesSuccessState extends TaskStates {}

class TaskGetAllDeviceLoadingState extends TaskStates {}

class TaskGetAllDeviceSuccessState extends TaskStates {}

class TaskGetAllDeviceErrorState extends TaskStates {
  final String error;
  TaskGetAllDeviceErrorState(this.error);
}

class TaskEditeDeviceLoadingState extends TaskStates {}

class TaskEditeDeviceSuccessState extends TaskStates {}

class TaskEditeDeviceErrorState extends TaskStates {
  final String error;
  TaskEditeDeviceErrorState(this.error);
}

class TaskChangeBottomNavState extends TaskStates {}

class TaskDeleteDeviceLoadingState extends TaskStates {}

class TaskDeleteDeviceSuccessState extends TaskStates {}

class maintanenceAddLoadingState extends TaskStates {}

class maintanenceAddSuccessState extends TaskStates {}

class maintanenceAddErrorsState extends TaskStates {
  late final String Error;
  maintanenceAddErrorsState(this.Error);
}

class GetAllMaintenanceHistoryLoadingState extends TaskStates {}

class GetAllMaintenanceHistorySuccessState extends TaskStates {}

class GetAllMaintenanceHistoryErrorState extends TaskStates {
  final String error;
  GetAllMaintenanceHistoryErrorState(this.error);
}

class EditeMaintenanceHistoryLoadingState extends TaskStates {}

class EditeMaintenanceHistorySuccessState extends TaskStates {}

class EditeMaintenanceHistoryErrorState extends TaskStates {
  final String error;
  EditeMaintenanceHistoryErrorState(this.error);
}

class maintanenceDeleteSuccessState extends TaskStates {}

class maintanenceDeleteErrorState extends TaskStates {}

class MaintenanceEditeLoadingState extends TaskStates {}

class MaintenanceEditeSuccessState extends TaskStates {}

class MaintenanceEditeErrorState extends TaskStates {
  final String error;
  MaintenanceEditeErrorState(this.error);
}

class changedefaultformfieldClickableState extends TaskStates {}
