import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/modules/business/business_screen.dart';
import 'package:flutter_application_11/modules/science/science_screen.dart';
import 'package:flutter_application_11/modules/setting/setting_screen.dart';
import 'package:flutter_application_11/modules/sports/sports_screen.dart';
import 'package:flutter_application_11/shared/network/local/cache_helper.dart';
import 'package:flutter_application_11/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = !fromShared;
      CacheHelper.putData(key: '$isDark', value: isDark).then((value) {
        emit(AppChangeAppModeState());
      });
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: '$isDark', value: isDark).then((value) {
        emit(AppChangeAppModeState());
      });
    }
  }
}
