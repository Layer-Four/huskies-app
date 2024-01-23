import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/provider/notifier.dart';
import 'package:huskies_app/views/auth/login_view.dart';
import 'package:huskies_app/views/widgets/navigation/nav_layer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';

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
    final state = ref.read(appStateNotifierProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: Stream.periodic(const Duration(minutes: 1), (timer) {
          return timer + 1;
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return
                // Do something
                state.user != null && state.user!.isLogIn
                    ? const ViewNavigator()
                    : const LoginView();
          } else if (snapshot.hasError) {
            final error = snapshot.error!;
            return Text(error.toString());
          } else {
            return const Text('Some error occurred - help!');
          }
        },
      ),
    );
  }
}
