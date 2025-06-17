import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor_fi/constants.dart';
import 'package:flavor_fi/models/recipe_model.dart';
import 'package:flavor_fi/services/get_recipes_by_search.dart';
import 'package:flavor_fi/widgets/recipes_by_search_list_builder.dart';
import 'package:flavor_fi/widgets/recipes_list_view_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/category_card.dart';
import '../widgets/category_list_view.dart';
import '../widgets/recipe_item.dart';
import '../widgets/recipes_list_view.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  String query = '';
  List<RecipeModel>? recipesBySearch;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String firstName = ModalRoute.of(context)!.settings.arguments as String;
      return WillPopScope(
        onWillPop: () async{
          setState(() {
            isSearching = false;
          });
          return Future.value(false);
        },
        child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Container(
                  height: 230,
                  width: double.infinity,
                  color: kPrimaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 55.0,horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hello, $firstName',style: TextStyle(
                                fontFamily: kFontFamily,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20
                            ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                FirebaseAuth.instance.signOut();
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  LoginScreen.id,
                                      (route)=>false,
                                );
                              },
                              child: Icon(
                                Icons.logout,color: Colors.white,size: 27,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          'Check amazing recipes..',style: TextStyle(
                            fontFamily: kFontFamily,
                            color: Colors.white,
                          fontSize: 15
                        ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextFormField(
                          controller: searchController,
                          maxLines: 1,
                          onChanged: (value){
                            setState (()  {
                              query = value;
                              isSearching = true;
                              print(recipesBySearch);
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                            hintText: 'Search',
                            prefixIcon: Icon(
                              CupertinoIcons.search,
                              color: Colors.black,
                              size: 25,),
                            hintStyle: TextStyle(
                              color: Colors.grey
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              isSearching ? Padding(
                padding: const EdgeInsets.only(right: 15.0,left: 15,bottom: 23),
                child: RecipesBySearchListBuilder(query: query),
              ): Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'Categories',style: TextStyle(
                     fontFamily: kFontFamily,
                     fontWeight: FontWeight.w600,
                     fontSize: 20
                   ),
                   ),
                   SizedBox(
                     height: 8,
                   ),
                   CategoryListView(),
                   SizedBox(
                     height: 25,
                   ),
                   Text(
                       'Popular recipes',style: TextStyle(
                       fontFamily: kFontFamily,
                       fontSize: 20,
                       fontWeight: FontWeight.w600
                   )
                   ),
                   RecipesListBuilder(),
                 ],
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}







