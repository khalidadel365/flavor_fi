import 'package:flavor_fi/models/categoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'category_card.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({
    super.key,
  });
  List<CategoriesModel> categories = [
    CategoriesModel(Icons.free_breakfast_outlined, 'Breakfast'),
    CategoriesModel(Icons.icecream_outlined, 'Dessert'),
    CategoriesModel(Icons.lunch_dining_outlined, 'Lunch'),
    CategoriesModel(FontAwesomeIcons.bowlRice, 'Snack'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 61,
      child: ListView.separated(
        separatorBuilder: (context,index)=>SizedBox(width: 10,),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return CategoryCard(
            category: categories[index],);
        },
        itemCount: categories.length,
      ),
    );
  }
}