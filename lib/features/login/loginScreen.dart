import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snackr/core/utils/config/style/textstyle.dart';
import 'package:snackr/features/home/HomeScreen.dart';
import 'package:snackr/features/login/forgotPassword.dart';
import 'package:snackr/features/signup/signupScreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  String email="",password='';
  final _formkey=GlobalKey<FormState>();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  userLongin()async{
    try{
      print(email+password);
  UserCredential userCredential=  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (_) => HomeScreen()));      print(email+password);

    } on FirebaseAuthException catch(e){
    if(e.code=='user-not-found'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No User Found for that Email",style: TextStyle(fontSize: 18.0,color: Colors.black),)));
    }else if(e.code=='wrong-password'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Password Provided by User",style: TextStyle(fontSize: 18.0,color: Colors.black),)));

    }else{
      print(e.code);
    }
  }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
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
                child: Form(
                  key: _formkey,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Login",
                                style: AppTextStyle.headTextStyle,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: emailController,
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return 'Please Enter email';
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
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return 'Please Enter password';
                                  }
                                  return null;
                                },
                                style: TextStyle(fontSize: 20),
                  obscureText: true,
                                decoration: InputDecoration(

                                    hintText: "Password",

                                    helperStyle: AppTextStyle.semiTextStyle,
                                    prefixIcon: Icon(Icons.password_outlined)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ForgotPassWord()));
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
                                onTap: ()async{
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email=emailController.text.trim();
                                      password=passwordController.text.trim();
                                    });
                                  }
                                  userLongin();
                                },
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.purple),
                                      child: Center(
                                        child: Text(
                                          "Login",
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
                      SizedBox(height: 20,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ",style: AppTextStyle.semiTextStyle,),
                          GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Signupscreen()));
                              },
                              child: Text("Sign Up",style: AppTextStyle.loginTextStyle,)),
                        ],
                      )

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
