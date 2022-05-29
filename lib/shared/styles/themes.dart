import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fristapp/shared/component/constants.dart';

ThemeData darkTheme= ThemeData(
            primarySwatch: defultColor,
            scaffoldBackgroundColor: Colors.grey[800],
            appBarTheme: AppBarTheme(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.grey[800],
                statusBarIconBrightness: Brightness.light,
              ),
              backgroundColor: Colors.grey[800],
              elevation: 0.0,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: defultColor,
              ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: defultColor,
              backgroundColor: Colors.grey[800],
              selectedIconTheme: IconThemeData(
                color:defultColor,
                 ),
              unselectedItemColor: Colors.grey,
              elevation: 20.0,
            ),
            textTheme: TextTheme(
            bodyText1: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
                color: Colors.white,
              ), 
            ),
            fontFamily: 'serif',
          );


ThemeData lightTheme= ThemeData(
            primarySwatch: defultColor,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: defultColor,
              ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: defultColor,
              elevation: 20.0,
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Colors.black,
              ), 
            ),
            //fontFamily: 'serif',
            //fontFamily: 'timeLine',
          );
 