import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/modules/web_view/web_view_screen.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget buildArticleItem(article, context) {
  return InkWell(
    onTap: () {
      navigateTo(context, WebViewScreen(url: article['url']));
    },
    child: SizedBox(
      height: 180,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                    '${article['urlToImage']}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3.0,
                      ),
                      child: Text(
                        '${article['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3.0,
                    ),
                    child: Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget articleBuilder(List<dynamic> list, ctx, {isSearch = false}) =>
    ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        itemCount: list.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], ctx),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(color: Colors.blueGrey.shade300),
        ),
      ),
      fallback: (context) => isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
