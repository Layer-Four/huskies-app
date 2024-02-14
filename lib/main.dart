import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:huskies_app/services/firebase_options.dart';
import 'package:huskies_app/views/navigation_view/nav_layer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

// TODO: image da.jpg doesnt work anymore, check why!!

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return const ViewNavigator();
    // return switch (ref.watch(statusProvider)) {
    //   AuthState.loggedIn => ref.watch(authProvider).when(
    //         loading: () => const LoadingView(),
    //         error: (error, stackTrace) {
    //           log('a Error occurrences: ${error.toString()} \n this was the path: $stackTrace');
    //           final errors = ref.watch(errorProvider);
    //           return ShowErrorScreen(
    //             error: 'error: ${errors.last}',
    //           );
    //         },
    //         data: (user) => const ViewNavigator(),
    //       ),
    //   AuthState.loading => const LoadingView(),
    //   AuthState.onRegistration => const WaitForRegistry(),
    //   AuthState.onError => ShowErrorScreen(error: ref.watch(errorProvider).last),
    //   _ => const LoginView(),
    // };
  }
}
