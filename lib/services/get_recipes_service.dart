import 'package:flavor_fi/helper/api.dart';
import 'package:flavor_fi/models/recipe_model.dart';

class GetRecipesService{
  Future<List<RecipeModel>> GetRecipes()async{
    Map<String,dynamic> jsonData = await Api().get(url: 'https://dummyjson.com/recipes');
    List<dynamic> data = jsonData['recipes'];
    List<RecipeModel> recipes = [];
    for(var item in data){
      recipes.add(RecipeModel.fromJson(item));
    }
    print(recipes);
    return recipes;
  }
}