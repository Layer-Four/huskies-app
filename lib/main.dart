import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/login_view.dart';
import 'package:huskies_app/gui/views/widgets/navigation/nav_layer.dart';
import 'package:huskies_app/logic/globals.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: state.user != null && state.user!.isLogIn ? const ViewNavigator() : const LoginView(),
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