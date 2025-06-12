import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:snackr/core/helper/cashe_helper/app_cashe_helper.dart';
import 'package:snackr/core/helper/cashe_helper/database.dart';
import 'package:snackr/features/home/HomeScreen.dart';
import 'package:snackr/features/login/forgotPassword.dart';
import 'package:snackr/features/login/loginScreen.dart';

import '../../core/helper/cashe_helper/shared_pref.dart';
import '../../core/utils/config/style/textstyle.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  String email = "", password = "", name = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   register(BuildContext context) async {
//     if (password != null) {
//       try {
//         print(email + password);
//
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);
//         // await FirebaseAuth.instance.createUserWithEmailAndPassword( email:  "arthur17@gmail.com",password:  "password",);
// print("Register Successfully");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Registered Successfully")),
//         );
//         Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
//       //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       //       content: Text(
//       //         "Register Successfully",
//       //         style: TextStyle(fontSize: 20),
//       //       )));
//       //   //
//       //   Navigator.of(context)
//       //       .push(MaterialPageRoute(builder: (_) => HomeScreen()));
//        } on FirebaseException catch (e) {
//         if (e.code == 'weak-password') {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(
//             "Password Provided is too weak",
//             style: TextStyle(fontSize: 20),
//           )));
//         } else if (e.code == 'email-already-in-use') {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               backgroundColor: Colors.orange,
//               content: Text(
//                 "Account already exists",
//                 style: TextStyle(fontSize: 20),
//               )));
//         }
//       }
//     }
//   }
  Future<void> register() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        email = emailController.text.trim();
        name = nameController.text.trim();
        password = passwordController.text.trim();
      });

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Show success message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Registered Successfully")),
          );
          String id = randomAlphaNumeric(10);
          Map<String, dynamic> addUserInfo = {
            "Name": nameController.text,
            "Email": emailController.text,
            'Wallet': '0',
            "Id": id,
          };
          await DataBaseMethods().addUserDetail(addUserInfo, id);
          await SharedPreferenceHelpers().saveUserEmail(emailController.text);
          await SharedPreferenceHelpers().saveUserName(nameController.text);
          await SharedPreferenceHelpers().saveUserId(id);
          await SharedPreferenceHelpers().saveUserWallet('0');

          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (_) => HomeScreen()),
          // );
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
        }
      } on FirebaseException catch (e) {
        if (!mounted) return;

        String errorMessage = "Registration failed";
        if (e.code == 'weak-password') {
          errorMessage = "Password Provided is too weak";
        } else if (e.code == 'email-already-in-use') {
          errorMessage = "Account already exists";
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor:
                e.code == 'email-already-in-use' ? Colors.orange : null,
            content: Text(errorMessage, style: TextStyle(fontSize: 20)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Colors.purple,
                      Colors.purple.shade500,
                    ])),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
              Container(
                margin: EdgeInsets.only(top: 35, left: 20, right: 20),
                child: Column(
                  children: [
                    Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "images/mediumr.png",
                          height: MediaQuery.of(context).size.height / 6,
                        ),
                        Text(
                          "Snackr",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                              fontFamily: "RubikGemstones"),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 5,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Form(
                          key: _formkey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Sign Up",
                                  style: AppTextStyle.headTextStyle,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter name';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                      hintText: "Name",
                                      helperStyle: AppTextStyle.semiTextStyle,
                                      prefixIcon: Icon(Icons.person)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter E-mail';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      helperStyle: AppTextStyle.semiTextStyle,
                                      prefixIcon: Icon(Icons.email)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter password';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(fontSize: 20),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      helperStyle: AppTextStyle.semiTextStyle,
                                      prefixIcon:
                                          Icon(Icons.password_outlined)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => ForgotPassWord()));
                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "Forgot Password",
                                      style: AppTextStyle.semiTextStyle,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        email = emailController.text.trim();
                                        name = nameController.text.trim();
                                        password =
                                            passwordController.text.trim();
                                      });
                                    }
                                    register();
                                  },
                                  child: Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        width: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.purple),
                                        child: Center(
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontFamily: 'Poppins'),
                                          ),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I Already have an account? ",
                          style: AppTextStyle.semiTextStyle,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Loginscreen()));
                            },
                            child: Text(
                              "Login",
                              style: AppTextStyle.loginTextStyle,
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
