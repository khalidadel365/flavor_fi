import 'package:flavor_fi/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

import '../models/recipe_model.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key});

  static final id = 'RecipeDetailsScreen';
  @override
  Widget build(BuildContext context) {
    RecipeModel recipeModel = ModalRoute.of(context)!.settings.arguments as RecipeModel;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Stack(
                children: [
                  Image.network(
                      height: 265,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      recipeModel.image!,
                  ),
                  Container(
                    margin: EdgeInsets.only(left:10,top: 10,),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      color: kPrimaryColor,
                        onPressed: (){
                        Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.black,)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipeModel.mealType!,style: TextStyle(
                              fontFamily: kFontFamily,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 18.5
                          ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                           recipeModel.name!.length >= 20 ? '${recipeModel.name!.substring(0,20)}...' : '${recipeModel.name}',style: TextStyle(
                              fontFamily: kFontFamily,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 18.5
                          ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                            Text('${recipeModel.rating}',style: TextStyle(
                              fontFamily: kFontFamily,
                              fontWeight: FontWeight.w500
                            ),),
                              SizedBox(width: 5,),
                              Icon(Icons.star,color: Colors.orangeAccent,),

                          ],)
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 35),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: Icon(
                                Icons.access_time,
                                  color: kPrimaryColor,
                              size: 23.5,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${recipeModel.cookTimeMinutes} min',style: TextStyle(
                              fontFamily: kFontFamily,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            fontSize: 12
                              ),)
                        ],
                      ),
                      SizedBox(width: 7,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 35),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: Icon(
                              FontAwesomeIcons.utensils,
                              color: kPrimaryColor,
                              size: 25.5,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            recipeModel.type!,style: TextStyle(
                            fontFamily: kFontFamily,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 12
                          ),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Instructions',style: TextStyle(
                      color: Colors.black,
                      fontFamily: kFontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ReadMoreText(
                    recipeModel.instructions.join('\n'),
                    colorClickableText: kPrimaryColor,
                    trimLines: 4,
                    trimMode: TrimMode.Line,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: kFontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Ingredients',style: TextStyle(
                      color: Colors.black,
                      fontFamily: kFontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      recipeModel.ingredients.map((e)=>e.toString()).join('\n'),
                   style:  TextStyle(
                        color: Colors.black,
                        fontFamily: kFontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
