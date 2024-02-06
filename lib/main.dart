import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/auth/login_view.dart';
import 'package:huskies_app/gui/views/home/home_view.dart';
import 'package:huskies_app/gui/views/shop/shop_view.dart';
import 'package:huskies_app/gui/views/ticket_views/ticket_shop_view.dart';
import 'package:huskies_app/gui/views/widgets/navigation/nav_layer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:huskies_app/logic/provider/notifier.dart';
import 'firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.read(appStateNotifierProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: state.user != null && state.user!.isLogIn
          ? const ViewNavigator()
          : const LoginView(),
    );
  }
}
