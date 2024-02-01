import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/auth/login_view.dart';
import 'package:huskies_app/gui/views/home/home_view.dart';
import 'package:huskies_app/gui/views/shop/shop_view.dart';
import 'package:huskies_app/gui/views/ticket_views/ticket_shop_view.dart';
import 'package:huskies_app/gui/views/widgets/navigation/nav_layer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/provider/auth_provider/auth_notifier.dart';
import 'package:huskies_app/provider/auth_provider/auth_state_provider.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/services/firebase_options.dart';
import 'package:huskies_app/views/auth/login_view.dart';
import 'package:huskies_app/views/navigation/nav_layer.dart';
import 'package:huskies_app/views/error/error_screen_widget.dart';
import 'package:huskies_app/views/wait_registry_view/wait_register_widget.dart';

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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  // TODO: when on Registry submitted reroute to login, with ref.read(statusProvider.notifier).reRouteToLogin()

  @override
  Widget build(BuildContext context, ref) {
    return switch (ref.watch(statusProvider)) {
      AuthState.loggedIn => ref.watch(authStateProvider).when(
            loading: () => Helpers.showLoadingView(context),
            error: (error, stackTrace) {
              log('a Error occurents: ${error.toString()} \n this was the path: $stackTrace');
              final errors = ref.watch(errorProvider);
              return ShowErrorScreen(
                error: 'error: ${errors.last}',
              );
            },
            data: (user) => const ViewNavigator(),
          ),
      AuthState.loading => Helpers.showLoadingView(context),
      AuthState.onRegistration => const WaitForRegistry(),
      AuthState.onError => ShowErrorScreen(error: ref.watch(errorProvider).last),
      _ => const LoginView(),
    };
  }
}


// Helpers.showLoadingView(
        //   context,
        //   advertising: ''' Bitte schau in dein Email Postfach
        //           \nveriifiziere dein Account 
        //           \n
        //           \n${werbung.$1}''',
        // ),
