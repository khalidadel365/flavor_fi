import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor_fi/constants.dart';
import 'package:flavor_fi/screens/register_screen.dart';
import 'package:flavor_fi/widgets/custom_button.dart';
import 'package:flavor_fi/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../helper/show_snack_bar.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsecure = true;
  bool visibleIcon = false;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  String? email,password;
  UserCredential? currentUser;
  String? firstName;
  String? lastName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 65.0,horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome back',
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Login to your account',
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontSize: 18,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email Address',
                    style: TextStyle(
                      fontFamily: kFontFamily,
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hintText: 'Email Address',
                  prefix: Icon(Icons.email_outlined,size: 30,),
                  onChange: (data){
                    email = data;
                  },
                ),
                SizedBox(
                  height: 17,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: kFontFamily,
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hintText: 'Password',
                  prefix: Icon(Icons.password,size: 30,),
                  obsecureText: isObsecure,
                  sufix: visibleIcon ? IconButton(
                    onPressed: (){
                     setState(() {
                       isObsecure = !isObsecure;
                       visibleIcon = !visibleIcon;
                     });
                    },
                    icon: Icon(Icons.remove_red_eye_outlined,size: 30,),
                  ) :
                  IconButton(
                    onPressed: (){
                      setState(() {
                        isObsecure = !isObsecure;
                        visibleIcon = !visibleIcon;
                      });
                    },
                    icon: Icon(Icons.visibility_off_outlined,size: 30,),
                  ) ,
                  onChange: (data){
                    password = data;
                  },
                ),
                SizedBox(
                  height: 70,
                ),
                CustomButton(
                    text: 'Login',
                    onPressed: () async {
                      if(formKey.currentState!.validate()){
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await loginUser();
                          await getData();
                          setState(() {
                            isLoading = false;
                          });
                          print(firstName);
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeScreen.id,
                              arguments: firstName,
                              (route)=>false,
                          );
                        }
                        on FirebaseAuthException catch(e){
                          print(e.code);
                          setState(() {
                            isLoading = false;
                          });
                          showSnackBar(
                              context: context,
                              message:'Email or Password may be incorrect.',
                              color: Colors.red);
                        }
                      }
                    }
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Don\'t have an account ?',
                      style: TextStyle(
                        fontFamily: kFontFamily,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,)
                      ),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, RegisterScreen.id);
                      } ,
                      child: Text(
                          'Sign Up',
                          style: TextStyle(
                        fontFamily: kFontFamily,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                        fontSize: 15,)
                      ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> loginUser() async {
    currentUser = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  Future<void> getData()async{
    await FirebaseFirestore.instance.collection('users')
        .doc(currentUser!.user!.uid).get().then((value){
          firstName = value['first_name'];
          lastName = value['last_name'];
    });
    print(' fff $firstName');
  }
}
