import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';

List<CategoryModel> category() {
  return <CategoryModel>[
    CategoryModel(
        categoryName: 'Business',
        imageUrl:
            'https://image.freepik.com/vector-gratis/empresarios-hablando-dibujos-animados-negocios_18591-47384.jpg',
        icons: Icons.business),
    CategoryModel(
        categoryName: 'Health',
        imageUrl:
            'https://image.freepik.com/free-vector/health-fitness-cartoon_24640-25781.jpg',
        icons: Icons.healing),
    CategoryModel(
        categoryName: 'Sports',
        imageUrl: 'https://code.org/images/sports/all_sports.png',
        icons: Icons.sports),
    CategoryModel(
        categoryName: 'Science',
        imageUrl:
            'https://image.freepik.com/free-vector/cartoon-scientist-with-chemical-elements_23-2147544793.jpg',
        icons: Icons.science),
    CategoryModel(
        categoryName: 'Technology',
        imageUrl:
            'https://previews.123rf.com/images/ellagrin/ellagrin1705/ellagrin170500002/78905220-creative-network-concept-silhouette-of-a-man-s-head-with-a-light-bulb-that-symbolizes-an-idea-surrou.jpg',
        icons: Icons.military_tech),
    CategoryModel(
        categoryName: 'Entertainment',
        imageUrl:
            'https://www.awn.com/sites/default/files/styles/large_featured/public/image/featured/1033050-warner-bros-home-entertainment-announces-peanuts-schulz-school-days-dvd.jpg?itok=Q6-Eplhd',
        icons: Icons.engineering),
  ];
}
