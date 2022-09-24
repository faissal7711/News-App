import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/modules/business/business_screen.dart';
import 'package:flutter_application_11/modules/science/science_screen.dart';
import 'package:flutter_application_11/modules/setting/setting_screen.dart';
import 'package:flutter_application_11/modules/sports/sports_screen.dart';
import 'package:flutter_application_11/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business_center,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_basketball,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  List<dynamic> business = [];

  void getBusiness() {
    if (business.isEmpty) {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': 'b9f6d48bddf64b85ada06e9f2bd64db0',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        business = value.data['articles'];
        print(business[2]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    if (sports.isEmpty) {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'b9f6d48bddf64b85ada06e9f2bd64db0',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[2]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    if (science.isEmpty) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'b9f6d48bddf64b85ada06e9f2bd64db0',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[2]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    search = [];
    if (search.isEmpty) {
      emit(NewsGetSearchLoadingState());
      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': 'b9f6d48bddf64b85ada06e9f2bd64db0',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        search = value.data['articles'];
        print(search[2]['title']);
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSearchSuccessState());
    }
  }

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  // bool isDark = false;
  //
  // void changeAppMode(){
  //   isDark = !isDark;
  //   emit(NewsChangeAppModeState());
  // }
}
