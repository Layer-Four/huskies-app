import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/constants/sponsors.dart';
import 'package:huskies_app/provider/appstate.dart';
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
    //* overrides: [], a list of Provider that can change on runtime, maybe same as a Flavor?
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: switch (ref.watch(statusProvider)) {
          AuthState.loggedIn => ref.watch(authProvider).when(
                loading: () => Material(
                    child: Helpers.showLoadingView(context,
                        advertising: sponsors.entries.last.value,
                        image: sponsors.entries.last.key)),
                error: (error, stackTrace) {
                  return MaterialApp(
                    home: Container(
                      color: Colors.red,
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                        Text('Error occurent $error'),
                        const Padding(
                            padding: EdgeInsets.all(8.0), child: BlueButton(text: 'Do Somthing')),
                      ]),
                    ),
                  );
                },
                data: (data) =>
                    const MaterialApp(debugShowCheckedModeBanner: false, home: ViewNavigator()),
              ),
          AuthState.onRegistation => Helpers.showLoadingView(
              context,
              advertising: sponsors.entries.last.value,
              image: sponsors.entries.last.key,
            ),
          _ => const LoginView(),
        });
  }
}
