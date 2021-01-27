import 'package:flutter/material.dart';
import 'package:newsapp/screen/categorynews.dart';

class CatShow extends StatelessWidget {
  final String imgurl;
  final String name;
  CatShow({
    @required this.name,
    @required this.imgurl,
  });

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => CategoryNews(category: name)));
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size * 0.05),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                imgurl,
              ),
              radius: size * 0.08,
            ),
          ),
          SizedBox(height: 2),
          Text(name)
        ],
      ),
    );
  }
}
