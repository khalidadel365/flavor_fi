class RecipeModel{
 final int id ;
 final String? name ;
 final num prepTimeMinutes ;
 final num cookTimeMinutes ;
 final String? difficulty ;
 final String? type ;
 final String? image ;
 final num reviewCount ;
 final num rating ;
 final dynamic mealType ;
 final List<dynamic> ingredients ;
 final List<dynamic> instructions ;
 RecipeModel({
   required this.name,
   required this.id,
   required this.prepTimeMinutes,
   required this.cookTimeMinutes,
   required this.difficulty,
   required this.type,
   required this.image,
   required this.reviewCount,
   required this.mealType,
   required this.rating,
   required this.ingredients,
   required this.instructions,});
 factory RecipeModel.fromJson(Map<String, dynamic> json){
   return RecipeModel(
       name: json['name'],
       id: json['id'],
       prepTimeMinutes: json['prepTimeMinutes'],
       cookTimeMinutes: json['cookTimeMinutes'],
       difficulty: json['difficulty'],
       type: json['cuisine'],
       image: json['image'],
       reviewCount: json['reviewCount'],
       mealType: json['mealType'][0],
       ingredients: json['ingredients'],
       rating: json['rating'],
      instructions: json['instructions']);
 }
}