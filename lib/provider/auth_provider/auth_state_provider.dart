// * Provider provides immutable objects and give a reference to it self or all providers in the provider scope?.
// * State provider contains mutable objects that are intended to change during runtime.
// * define a "Logger" object for Logging and give the access to them

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/provider/static_provider.dart';

// TODO: refacor this. i didnt understand streams and yield :'(
/// this provider returns a instance from Firebase authentication services
/// and give us a everytime updated user instance from DB.

final authStateProvider = StreamProvider<User?>((ref) async* {
  FirebaseAuth.instance.authStateChanges().map((user) {
    if (user != null) {
      if (!user.emailVerified) {
        ref.read(statusProvider.notifier).waitOnRegistration();
      } else {
        ref.read(statusProvider.notifier).userLogIn();
      }
    }
  });
});
