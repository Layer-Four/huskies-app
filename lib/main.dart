import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/constants/sponsors.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/services/firebase_options.dart';
import 'package:huskies_app/views/auth/login_view.dart';
import 'package:huskies_app/views/widgets/blue_button_widget.dart';
import 'package:huskies_app/views/navigation/nav_layer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Material(
        child: switch (ref.watch(statusProvider)) {
      AuthState.loggedIn => ref.watch(authProvider).when(
            loading: () => Helpers.showLoadingView(context,
                advertising: sponsors.entries.last.value, image: sponsors.entries.last.key),
            error: (error, stackTrace) {
              return Helpers.showLoadingView(
                context,
                advertising: 'es ist ein Fehler aufgetreten',
                image: sponsors.entries.last.key,
                button: const BlueButton(text: 'Do Somthing'),
              );
            },
            data: (data) => const ViewNavigator(),
          ),
      AuthState.onRegistation => Helpers.showLoadingView(
          context,
          advertising: ''' 
                  Bitte schau in dein Email Postfach
                  \nveriifiziere dein Account 
                  \n
                  \n${sponsors.entries.last.value}''',
          image: sponsors.entries.last.key,
        ),
      _ => const LoginView(),
    });
  }
}
