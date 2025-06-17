import 'package:flavor_fi/widgets/recipe_item.dart';
import 'package:flavor_fi/widgets/recipes_list_view_builder.dart';
import 'package:flutter/material.dart';

import '../models/recipe_model.dart';

class RecipesListView extends StatelessWidget {
   RecipesListView({
    super.key,
    required this.recipes,
  });
  List<RecipeModel> recipes = [];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context,index){
        return SizedBox(height: 30,);
      },
      itemBuilder: (context,index){
        return RecipeItem(
          recipeModel: recipes[index],
        );
      },
      itemCount: recipes.length,
    );
  }
}

