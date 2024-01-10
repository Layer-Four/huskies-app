import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/widgets/navigation/nav_layer.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ViewNavigator(),
        ),
      ),
    );
  }
}


// class FirebaseAuthRepository {
//   FirebaseAuthRepository._privateConstructor();   
//   static final FirebaseAuthRepository _instance = FirebaseAuthRepository._privateConstructor();  
//   factory FirebaseAuthRepository() {
//     return _instance;
//   }
// }