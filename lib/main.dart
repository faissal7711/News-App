// ignore_for_file: unused_label

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_11/layouts/news/cubit/news_cubit.dart';
import 'package:flutter_application_11/layouts/news/cubit/news_states.dart';
import 'package:flutter_application_11/shared/app_cubit/app_cubit.dart';
import 'package:flutter_application_11/shared/app_cubit/app_cubit.dart';
import 'package:flutter_application_11/shared/app_cubit/app_cubit.dart';
import 'package:flutter_application_11/shared/app_cubit/app_states.dart';
import 'package:flutter_application_11/shared/network/local/cache_helper.dart';
import 'package:flutter_application_11/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layouts/counter/counter.dart';
import 'layouts/news/news_layout.dart';
import 'shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  BlocOverrides.runZoned(
    () {
      DioHelper.init();
      bool? isDark = CacheHelper.getData(key: 'isDark');
      // CacheHelper.init();
      runApp(MyApp(
        isDark: isDark,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
  // print('main 2');
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({Key? key, this.isDark}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                textTheme: TextTheme(
                  bodyText2: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                iconTheme: IconThemeData(color: Colors.black),
                backwardsCompatibility: false,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: Colors.white,
                ),
                elevation: 0.0,
              ),
              textTheme: TextTheme(
                bodyText2: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              primaryTextTheme: TextTheme(
                bodyText2: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                elevation: 20,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
              ),
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
            ),
            darkTheme: ThemeData(
              primaryTextTheme: TextTheme(
                bodyText2: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              scaffoldBackgroundColor: Color(0xFF333739),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFF333739),
                textTheme: TextTheme(
                  bodyText2: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                iconTheme: IconThemeData(color: Colors.white),
                backwardsCompatibility: false,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Color(0xFF333739),
                ),
                elevation: 0.0,
              ),
              textTheme: TextTheme(
                bodyText2: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                elevation: 20,
                unselectedItemColor: Colors.grey,
                backgroundColor: Color(0xFF333739),
                type: BottomNavigationBarType.fixed,
              ),
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
            // home: CounterScreen(),
          );
        },
      ),
    );
  }
}

/*
* https://newsapi.org/
* v2/top-headlines?
* country=eg&category=business&apiKey=b9f6d48bddf64b85ada06e9f2bd64db0
*
* */
