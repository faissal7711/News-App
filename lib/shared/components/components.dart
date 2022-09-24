import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article,context) {
  return SizedBox(
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
  );
}

Widget articleBuilder(list,ctx) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index],ctx),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(color: Colors.blueGrey.shade300),
        ),
      ),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
