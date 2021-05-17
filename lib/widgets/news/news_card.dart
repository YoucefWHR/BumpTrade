import 'package:flutter/material.dart';
import 'package:bumptrade/helpers/url/url.dart';

import 'package:bumptrade/models/news/single_new_model.dart';
import 'package:bumptrade/shared/styles.dart';

class NewsCardWidget extends StatelessWidget {
  final String title;
  final List<SingleNewModel> news;

  NewsCardWidget(
    {@required this.title, @required this.news})
      : assert(news != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(),
        Text(
          this.title,
          style: TextStyle(
              height: 1.6,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.black),
        ),
        Container(
          height: 380,
          child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: news.length,
              itemBuilder: (BuildContext context, int i) => Padding(
                  padding: EdgeInsets.only(top: 10, right: 4),
                  child: _renderNewsArticle(news[i]))),
        )
      ],
    );
  }

  Widget _renderNewsArticle(SingleNewModel singleNew) {
    print(singleNew.title);
    return GestureDetector(
      onTap: () => launchUrl(singleNew.url),
      child: Container(
        width: 392,
        child: Column(
          children: <Widget>[
            // Container(
            //   height: 100,
            //    width: 150,
            //   decoration: BoxDecoration(
            //    //shape: ,
            //       image: DecorationImage(image: _imageIsValid(singleNew.urlToImage))
            //       ),
            // ),
            Padding(
                padding: EdgeInsets.only(right: 12),
                child: ClipRect(
                    child: Container(
                        child: Align(
                  // alignment: Alignment.center,
                  // widthFactor: 0.5,
                  // heightFactor: 1.0,
                  child: Image(
                    image: _imageIsValid(singleNew.urlToImage),
                    height: 200.0,
                    width: 600.0,
                  ),
                )))),

            Padding(
              padding: EdgeInsets.only(bottom: 8, right: 0),
              child: Text(
                singleNew.title,
                style: TextStyle(
                    height: 1.6,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider _imageIsValid(String url) {
    return url == null
        ? AssetImage('assets/images/default.jpg')
        : NetworkImage(url);
  }
}
