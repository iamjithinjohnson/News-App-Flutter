import 'package:flutter/widgets.dart';

class CategoryModel {
  String categoryName;
  String imageUrl;
  IconData icons;

  CategoryModel({
    @required this.categoryName,
    @required this.imageUrl,
    @required this.icons,
  });
}
