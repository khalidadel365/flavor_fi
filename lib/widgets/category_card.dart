import 'package:flavor_fi/models/categoriesModel.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    required this.category,
  });
  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, 'RecipesByCategoryScreen',
            arguments: category.name);
      },
      child: Container(
        padding: EdgeInsets.only(
            left: 6,
            top: 6,
            bottom: 6,
            right: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 1,
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10
              ),
              margin: EdgeInsets.only(left:2,right: 2,bottom: 1.8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Color(0xffEDF1E7), // light green bottom
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
                color: kSecondaryColor,
              ),
              child: Icon(
                  category.icon,
                  color: kPrimaryColor,
                  size: 35),
            ),
            SizedBox(
              width: 3.5,
            ),
            Text(
              category.name,style: TextStyle(
                fontFamily: kFontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: kPrimaryColor
            ),
            ),
          ],
        ),
      ),
    );
  }
}