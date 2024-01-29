// * Provider provides inmutable objectes and give a reference to it self or all providers in the providerscope?.
// * Stateprovider contains mutable objects that are intended to change during runtime.
// * define a "Logger" object for Logging and give the acces to them

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/provider/static_provider.dart';

/// this provider returns a instance from Firebase authification servies
/// and give us a everytime updated user instance from DB.
final authStateProvider = StreamProvider<User?>((ref) {
  final firebaseAuth = ref.watch(fireAuthInstance);
  return firebaseAuth.authStateChanges().map((user) {
    if (user != null) {
      if (!user.emailVerified) {
        // ref.read(statusProvider.notifier).state = AuthState.onRegistation;
        return user;
      }
      // ref.read(statusProvider.notifier).state = AuthState.loggedIn;
      return user;
    }
    return null;
  });
});
