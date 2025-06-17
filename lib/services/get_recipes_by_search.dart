import 'package:flavor_fi/helper/api.dart';
import 'package:flavor_fi/models/recipe_model.dart';

class GetRecipesBySearch{
  Future<List<RecipeModel>> GetRecipes(
      String query
      )async{
    Map<String,dynamic> jsonData = await Api().get(url:'https://dummyjson.com/recipes/search?q=$query');
    List<dynamic> data = jsonData['recipes'];
    List<RecipeModel> recipes = [];
    for(var item in data){
      recipes.add(RecipeModel.fromJson(item));
    }
    print(recipes);
    return recipes;
  }
}