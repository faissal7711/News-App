import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/layouts/news/cubit/news_cubit.dart';
import 'package:flutter_application_11/layouts/news/cubit/news_states.dart';
import 'package:flutter_application_11/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var list = NewsCubit.get(context).business;
        return articleBuilder(list,context);
      },
    );
  }
}
