import 'package:flavor_fi/widgets/recipes_list_view.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/recipe_model.dart';
import '../services/get_recipes_by_category.dart';

class RecipesByCategoryListBuilder extends StatelessWidget {
  const RecipesByCategoryListBuilder({
    super.key,
    required this.category
  });
  final String category ;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecipeModel>>(
        future: GetRecipesByCategoryService().getRecipesByCategory(category: category),
        builder: (context,snapshot){
          print('ConnectionState: ${snapshot.connectionState}');
          print('HasData: ${snapshot.hasData}');
          print('Data: ${snapshot.data}');
          print('Error: ${snapshot.error}');
          if(snapshot.hasData){
            print('ss');
            print('______________________');
            print(snapshot.data);
            return RecipesListView(recipes: snapshot.data!);
          }
          else{
            return Center(child: CircularProgressIndicator(color: kPrimaryColor,));
          }
        });
  }
}
