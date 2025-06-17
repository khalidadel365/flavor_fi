import 'package:flavor_fi/services/get_recipes_by_category.dart';
import 'package:flavor_fi/widgets/recipes_by_category_list_builder.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/recipe_model.dart';
import '../widgets/recipes_list_view.dart';

class RecipesByCategoryScreen extends StatelessWidget {
  RecipesByCategoryScreen({super.key});

  static final id = 'RecipesByCategoryScreen';
  final Map<String,String> titles ={
     'Breakfast' : 'Sunrise Flavors' ,
     'Dessert' :'Delicious Desserts',
     'Lunch' : 'Tasty Lunch Ideas' ,
     'Snack' : 'Delicious Snacks',
  };
  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('${titles[categoryName]}',style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
            child: Column(
              children: [
                RecipesByCategoryListBuilder(category:categoryName ,),
              ],
            ),
          ),
        ),
      )
    );
  }
}
