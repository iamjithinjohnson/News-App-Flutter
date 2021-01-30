import 'package:flutter/material.dart';
import 'package:newsapp/helper/category.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/screen/settings.dart';
import 'package:newsapp/widgets/categoryShow.dart';
import 'package:newsapp/widgets/nointernet.dart';
import 'package:newsapp/widgets/showHorizontal.dart';
import 'package:newsapp/widgets/showVertical.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  var axis = false.obs;

  var _loading = true.obs;

  var _currentind = 0.obs;
  List<ArticleModel> newslist = [];

  List<CategoryModel> catmodel = category();

  var _index = 0;

  getNews() async {
    News news = News();
    await news.getNews();
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News',
                      style: TextStyle(
                          fontSize: 21,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Settings()));
                      },
                      child: Icon(Icons.settings),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                        onTap: () {
                          axis.value = !axis.value;
                        },
                        child: Obx(() => axis.value
                            ? Icon(Icons.panorama_vertical)
                            : Icon(Icons.panorama_horizontal)))
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.width * 0.22,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: catmodel.length,
                      itemBuilder: (BuildContext context, int ind) {
                        return CatShow(
                          name: catmodel[ind].categoryName,
                          imgurl: catmodel[ind].imageUrl,
                        );
                      })),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => refreshList(),
                  child: FutureBuilder(
                    future: getNews(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return snapshot.hasError
                          ? noInternet(context: context, refresh: refreshList)
                          : Obx(() => _loading.value
                              ? Center(
                                  heightFactor: 8,
                                  child: CircularProgressIndicator())
                              : ListView.builder(
                                  itemCount: axis.value ? newslist.length : 1,
                                  shrinkWrap: axis.value ? false : true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return axis.value
                                        ? ShowVertical(
                                            title: newslist[index].title,
                                            desc: newslist[index].description,
                                            imgurl: newslist[index].urlToImage,
                                            url: newslist[index].articleUrl,
                                            source: newslist[index].author,
                                          )
                                        : BuildCarousel(
                                            index: index,
                                            newslist: newslist,
                                          );
                                    // : _buildCarousel(context, index);
                                  },
                                ));
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildCarousel(BuildContext context, int index) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.80,
      child: PageView.builder(
        itemCount: newslist.length,
        onPageChanged: (var index) {
          // setState(() {
          //   _index = index;
          // });
          // print('index.obs = ${index.obs}');
        },
        physics: BouncingScrollPhysics(),
        // store this controller in a State to save the carousel scroll position
        controller: PageController(viewportFraction: 0.85),
        itemBuilder: (BuildContext context, int itemIndex) {
          // print('itemIndex.obs = ${itemIndex.obs}');

          return Transform.scale(
            scale: itemIndex == _index ? 1 : 0.9,
            child: ShowHorizontal(
              title: newslist[itemIndex].title,
              desc: newslist[itemIndex].description,
              imgurl: newslist[itemIndex].urlToImage,
              url: newslist[itemIndex].articleUrl,
              source: newslist[itemIndex].author,
            ),
          );
        },
      ),
    );
  }
}

class BuildCarousel extends StatefulWidget {
  final int index;
  final List<ArticleModel> newslist;
  BuildCarousel({this.index, this.newslist});

  @override
  _BuildCarouselState createState() => _BuildCarouselState();
}

class _BuildCarouselState extends State<BuildCarousel> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.80,
      child: PageView.builder(
        itemCount: widget.newslist.length,
        onPageChanged: (var index) {
          setState(() {
            _index = index;
          });
          // print('index.obs = ${index.obs}');
        },
        physics: BouncingScrollPhysics(),
        // store this controller in a State to save the carousel scroll position
        controller: PageController(viewportFraction: 0.85),
        itemBuilder: (BuildContext context, int itemIndex) {
          // print('itemIndex.obs = ${itemIndex.obs}');

          return Transform.scale(
            scale: itemIndex == _index ? 1 : 0.9,
            child: ShowHorizontal(
              title: widget.newslist[itemIndex].title,
              desc: widget.newslist[itemIndex].description,
              imgurl: widget.newslist[itemIndex].urlToImage,
              url: widget.newslist[itemIndex].articleUrl,
              source: widget.newslist[itemIndex].author,
            ),
          );
        },
      ),
    );
  }
}
