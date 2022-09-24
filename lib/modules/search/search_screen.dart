import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/layouts/news/cubit/news_cubit.dart';
import 'package:flutter_application_11/layouts/news/cubit/news_states.dart';
import 'package:flutter_application_11/shared/components/components.dart';
import 'package:flutter_application_11/shared/components/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var txtControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Search'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: txtControler,
                  onChanged: (val) {
                    NewsCubit.get(context).getSearch(val);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'errVal';
                    }
                  },
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    fillColor: Colors.white.withOpacity(0.2),
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                  ),
                  // onSaved: onClick(),
                ),
              ),
              Expanded(child: articleBuilder(list, context, isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
