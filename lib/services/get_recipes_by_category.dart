import 'package:flavor_fi/models/recipe_model.dart';

import '../helper/api.dart';

class GetRecipesByCategoryService{
  Future<List<RecipeModel>> getRecipesByCategory({required String category})async {
    Map<String,dynamic> jsonData = await Api().get(url: 'https://dummyjson.com/recipes/meal-type/$category');
    List<dynamic> data = jsonData['recipes'];
    List<RecipeModel> recipesByCategory = [];
    for(var item in data){
      recipesByCategory.add(RecipeModel.fromJson(item));
    }
    print(recipesByCategory);
    return recipesByCategory;
  }
}