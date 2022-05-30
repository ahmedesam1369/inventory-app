import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristapp/layout/final_task_app/cubit/cubit.dart';
import 'package:fristapp/shared/component/constants.dart';
import 'package:fristapp/shared/cubit/cubit.dart';
import 'package:fristapp/shared/cubit/states.dart';
import 'package:fristapp/shared/network/local/cache_helper.dart';
import 'package:fristapp/shared/network/remote/dio_helper.dart';
import 'package:fristapp/shared/styles/bloc_observer.dart';
import 'package:fristapp/shared/styles/themes.dart';
import 'layout/final_task_app/task_layoyt.dart';
import 'modules/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CachHelper.init();
  Widget widget;
  uId = await CachHelper.getData(key: 'uId');
  if (uId != null) {
    widget = FinalTaskLayout();
  } else {
    widget = LoginScreen();
  }

  Stream<DatabaseEvent> data =
      FirebaseDatabase.instance.ref("Users").onChildAdded;
  Stream<DatabaseEvent> data2 = FirebaseDatabase.instance.ref("Users").onValue;

  print(data2.toList().then((value) {
    print(value);
  }));

  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  late final Widget statrWidget;
  MyApp(this.statrWidget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(create: (context) => FinalTaskCubit()..GetAllDevices()
            // ..getAllmaintanenceHistory()
            ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit().get(context).IsDark
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: statrWidget,
          );
        },
      ),
    );
  }
}
