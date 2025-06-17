import 'package:flavor_fi/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class RecipeItem extends StatelessWidget {
   RecipeItem({
    super.key,
    required this.recipeModel,
  });
  RecipeModel? recipeModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
            context,
            'RecipeDetailsScreen',
            arguments: recipeModel);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
                recipeModel!.image!,
                ),
          ),
          Positioned(
            top: 180,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: 90,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        recipeModel!.name!,style: TextStyle(
                      fontFamily: kFontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    )
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${recipeModel!.prepTimeMinutes} min',style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.solidCircle,
                          color: kPrimaryColor,
                          size: 12,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          recipeModel!.difficulty!,style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.solidCircle,
                          color: kPrimaryColor,
                          size: 12,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          recipeModel!.mealType!,style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(4.5),
            margin: EdgeInsets.only(
              left: 15,
              top: 10
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 20,),
                Text(
                  '${recipeModel!.rating} (${recipeModel!.reviewCount} Review)',style: TextStyle(
                  fontFamily: kFontFamily,
                  fontWeight: FontWeight.w500,
                ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
