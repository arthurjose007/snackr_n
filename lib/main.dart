import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';
//import 'package:snackr/core/helper/cashe_helper/app_constant.dart';
 import 'core/helper/httpOverrides.dart';
import 'features/wallet/wallet.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snackr/features/home/HomeScreen.dart';
import 'package:snackr/features/login/loginScreen.dart';
import 'package:snackr/features/onboard/onboardScreen.dart';

import 'core/utils/shared/component/widgets/bottomaappbar.dart';
void main()async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  //Stripe.publishableKey=publishableKey;
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snackr',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: WalletScreen(),
    );
  }
}

