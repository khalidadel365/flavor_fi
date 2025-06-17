import 'package:flavor_fi/constants.dart';
import 'package:flavor_fi/services/get_recipes_by_search.dart';
import 'package:flavor_fi/services/get_recipes_service.dart';
import 'package:flavor_fi/widgets/recipes_list_view.dart';
import 'package:flutter/material.dart';

import '../helper/show_snack_bar.dart';
import '../models/recipe_model.dart';
import 'recipe_item.dart';

class RecipesBySearchListBuilder extends StatelessWidget {
  const RecipesBySearchListBuilder({
    super.key, required this.query,
  });
  final String query;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<List<RecipeModel>>(
        future: GetRecipesBySearch().GetRecipes(query),
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
          else if (snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }
          else{
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 245.0),
              child: Center(child: CircularProgressIndicator(color: kPrimaryColor,)),
            );
          }
        });
  }
}