import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';

// TODO: refacor this! I didnt understand streams and yield :'(

/// this provider returns a instance from Firebase authentication services
/// and give us a everytime updated user instance from DB.
final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges().map((user) {
    if (user != null) {
      log(user.toString());

      ref.read(userProvider.notifier).initUser(user.uid);
      if (!user.emailVerified) {
        ref.read(statusProvider.notifier).waitOnRegistration();
      } else {
        ref.read(statusProvider.notifier).onLogIn();
      }
    }
    return null;
  });
});
