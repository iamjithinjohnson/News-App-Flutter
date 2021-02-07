import 'package:flutter/material.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/widgets/nointernet.dart';
import 'package:newsapp/widgets/showVertical.dart';
import 'package:get/get.dart';
import 'package:newsapp/widgets/showleftvertical.dart';
import 'package:newsapp/widgets/showrightvertical.dart';
import 'package:newsapp/widgets/showverticaltop.dart';
import './settings.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({
    this.category,
  });

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var _loading = true.obs;
  List<ArticleModel> newslist = [];
  getNews() async {
    CategoryNewss news = CategoryNewss();
    await news.getNews(widget.category.toLowerCase());
    newslist = news.news;

    _loading.value = false;
  }

  Future<void> refreshList() async {
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.category,
                  style: TextStyle(
                      fontSize: 21,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Settings()));
                  },
                  child: Icon(Icons.settings),
                ),
              ],
            ),
          ),
          Flexible(
            child: FutureBuilder(
              future: getNews(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.hasError
                    ? noInternet(context: context, refresh: refreshList)
                    : Obx(() => _loading.value
                        ? Center(
                            heightFactor: 8, child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                ListView.builder(
                                    itemCount: 1,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          ShowVerticalTop(
                                            title: newslist[index].title,
                                            desc: newslist[index].description,
                                            imgurl: newslist[index].urlToImage,
                                            url: newslist[index].articleUrl,
                                            source: newslist[index].source,
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              ShowLeftVertical(
                                                title:
                                                    newslist[index + 1].title,
                                                desc: newslist[index + 1]
                                                    .description,
                                                imgurl: newslist[index + 1]
                                                    .urlToImage,
                                                url: newslist[index + 1]
                                                    .articleUrl,
                                                source:
                                                    newslist[index + 1].source,
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    ShowRightVertical(
                                                      title: newslist[index + 2]
                                                          .title,
                                                      desc: newslist[index + 2]
                                                          .description,
                                                      imgurl:
                                                          newslist[index + 2]
                                                              .urlToImage,
                                                      url: newslist[index + 2]
                                                          .articleUrl,
                                                      source:
                                                          newslist[index + 2]
                                                              .source,
                                                    ),
                                                    SizedBox(height: 10),
                                                    ShowRightVerticalBottom(
                                                      title: newslist[index + 3]
                                                          .title,
                                                      desc: newslist[index + 3]
                                                          .description,
                                                      imgurl:
                                                          newslist[index + 3]
                                                              .urlToImage,
                                                      url: newslist[index + 3]
                                                          .articleUrl,
                                                      source:
                                                          newslist[index + 3]
                                                              .source,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }),
                                ListView.builder(
                                  itemCount: newslist.length - 4,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ShowVertical(
                                      title: newslist[index + 4].title,
                                      desc: newslist[index + 4].description,
                                      imgurl: newslist[index + 4].urlToImage,
                                      url: newslist[index + 4].articleUrl,
                                      source: newslist[index + 4].source,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ));
              },
            ),
          )
        ],
      )),
    );
  }
}
