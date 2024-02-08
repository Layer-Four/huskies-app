import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/models/user_vm/user_model.dart';
import 'package:huskies_app/provider/static_provider.dart';

// TODO: refacor this. i didnt understand streams and yield :'(
/// this provider returns a instance from Firebase authentication services
/// and give us a everytime updated user instance from DB.

final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges().map((user) {
    if (user != null) {
      ref.read(userProvider.notifier).state = UserModel(
        uID: user.uid,
        displayedName: user.displayName,
        email: user.displayName,
        emailVerified: user.emailVerified,
        phoneNumber: int.tryParse(user.phoneNumber ?? 'nischts'),
        tenantID: user.tenantId,
        userImage: user.photoURL,
      );
      if (!user.emailVerified) {
        ref.read(statusProvider.notifier).waitOnRegistration();
      } else {
        ref.read(statusProvider.notifier).onLogIn();
      }
    }
    return null;
  });
});
