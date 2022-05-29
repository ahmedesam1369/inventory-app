abstract class TaskStates {}

class TaskInitialState extends TaskStates {}

class TaskAddUserLoadingState extends TaskStates {}

class TaskAddUserSuccessState extends TaskStates {}

class TaskAddUserErrorsState extends TaskStates {
  late final String Error;
  TaskAddUserErrorsState(this.Error);
}

class TaskGetUserLoadingState extends TaskStates {}

class TaskGetUserSuccessState extends TaskStates {}

class TaskGetUserErrorState extends TaskStates {
  final String error;
  TaskGetUserErrorState(this.error);
}

class TaskGetAllUserLoadingState extends TaskStates {}

class TaskGetAllUserSuccessState extends TaskStates {}

class TaskGetAllUserErrorState extends TaskStates {
  final String error;
  TaskGetAllUserErrorState(this.error);
}

class TaskEditeUserLoadingState extends TaskStates {}

class TaskEditeUserSuccessState extends TaskStates {}

class TaskEditeUserErrorState extends TaskStates {
  final String error;
  TaskEditeUserErrorState(this.error);
}

class TaskChangeBottomNavState extends TaskStates {}

class TaskImagePickedSuccessState extends TaskStates {}

class TaskImagePickedErrorState extends TaskStates {}

class TaskDeleteUserLoadingState extends TaskStates {}

class TaskDeleteUserSuccessState extends TaskStates {}

class Sucsses extends TaskStates {}
