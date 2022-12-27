import 'package:autharapp/view/addData.dart';
import 'package:autharapp/view/homeScreen.dart';
import 'package:autharapp/view/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>SplashScreen(),
        '/home':(context)=>HomeScreen(),
        '/add':(context)=>AddData(),

      },
    )
  );
}