import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavor_fi/constants.dart';
import 'package:flavor_fi/screens/home_screen.dart';
import 'package:flavor_fi/widgets/custom_button.dart';
import 'package:flavor_fi/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../helper/show_snack_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static final String id = 'RegisterScreen';


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObsecure = true;

  bool visibleIcon = false;

  GlobalKey<FormState> formKey = GlobalKey();
  String? email,password,firstName,lastName;
  bool isLoading = false;
  UserCredential? currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45.0,horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Register',
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
                  'Create your own account',
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontSize: 18,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'First Name',
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
                    hintText: 'First Name',
                    onChange: (data){
                      firstName = data;
                    }
                ),
                SizedBox(
                  height: 17,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Last Name',
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
                    hintText: 'Last Name',
                    onChange: (data){
                      lastName = data;
                    }
                ),
                SizedBox(
                  height: 17,
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
                    onChange: (data){
                      email = data;
                    }
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
                  }

                ),
                SizedBox(
                  height: 55,
                ),
                CustomButton(
                    text: 'Sign Up',
                    onPressed: ()async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await registerUser();
                          await storeData();

                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.id,
                            arguments: firstName,
                                (route)=>false,
                          );
                        }on FirebaseAuthException catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                          print(e.code);
                          if (e.code == 'weak-password') {
                            showSnackBar(
                                context: context,
                                message: 'The password provided is too weak.',
                                color: Colors.red
                            );
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(
                                context: context,
                                message: 'The account already exists for that email.',
                                color: Colors.red);
                          }
                        }
                        catch(e){
                          print(e.toString());
                          setState(() {
                            isLoading = false;
                          });
                          showSnackBar(
                              context: context,
                              message: 'there was an error',
                              color: Colors.red);
                        }
                      }
                    },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                        'Already have an account ?',
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
                        Navigator.pop(context);
                      } ,
                      child: Text(
                          'Login',
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
  Future<void> registerUser() async {
    currentUser = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
  Future<void> storeData () async {
    await FirebaseFirestore.instance.collection('users')
        .doc(currentUser!.user!.uid).set({
      'first_name': firstName,
      'last_name': lastName,
    });
  }
}
