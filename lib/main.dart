import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flavor_fi/constants.dart';
import 'package:flavor_fi/screens/home_screen.dart';
import 'package:flavor_fi/screens/login_screen.dart';
import 'package:flavor_fi/screens/recipe_details_screen.dart';
import 'package:flavor_fi/screens/recipes_by_category_screen.dart';
import 'package:flavor_fi/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FlavorFi());
}

class FlavorFi extends StatelessWidget {
  const FlavorFi({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
        selectionColor: kSecondaryColor, // Highlight color
        cursorColor: kSecondaryColor,    // Cursor color
        selectionHandleColor: kSecondaryColor, // Handle color
    ),
        ),
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        RecipeDetailsScreen.id: (context) => const RecipeDetailsScreen(),
        RecipesByCategoryScreen.id: (context) =>  RecipesByCategoryScreen(),
      },
      home: AnimatedSplashScreen(
        splash: Lottie.asset(
            'assets/images/splash.json',
            width: 300,height: 300,),
        duration: 3000,
        splashIconSize: 2000,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: LoginScreen(),
      ),
    );
  }
}




