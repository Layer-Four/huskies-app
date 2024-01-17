import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class FirebaseAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: [
  //     'email',
  //     'profile',
  //   ],
  // );
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Stream<User?> userAuthState() => _auth.userChanges().handleError(
        (e) {
          log('$e en error occurent');
          // logger.e(e.toString());
          // throw AppStrings.errorFetchingUserAuthStatus;
        },
      );
  final logger = Logger();
  String? getAuthProvider() => _auth.currentUser?.providerData.firstOrNull?.providerId;

  Future<void> registerUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser?.sendEmailVerification();

      await _users.doc(userCredential.user?.uid).set({
        'uid': userCredential.user?.uid,
        'email': email,
        'accountCreationDate': FieldValue.serverTimestamp(),
        'profileImageUrl': '',
        'name': email.split('@').first,
        // generateUsername(email),
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw ('email is already used');
        case 'invalid-email':
          throw 'inavlid email';
        case 'operation-not-allowed':
          throw 'operation is not allowed';
        case 'weak-password':
          throw 'weak password';
        default:
          throw 'es ist etwas schief gelaufen';
      }
    } catch (e) {
      logger.e(e.toString());
      throw 'es ist etwas schief gelaufen';
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw ('email is already used');
        case 'invalid-email':
          throw 'inavlid email';
        case 'operation-not-allowed':
          throw 'operation is not allowed';
        case 'weak-password':
          throw 'weak password';
        default:
          throw 'es ist etwas schief gelaufen';
      }
    } catch (e) {
      logger.e(e.toString());
      throw 'es ist etwas schiefgelaufen';
    }
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  //     if (googleSignInAccount == null) {
  //       throw Exception('Google sign in was aborted or failed.');
  //     }

  //     final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;
  //     final OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     UserCredential userCredential = await _auth.signInWithCredential(credential);
  //     if (userCredential.user == null) {
  //       throw Exception('Failed to obtain Firebase user after sign in.');
  //     }
  //     String uid = userCredential.user!.uid; // Using '!' as we've checked it's not null above.
  //     DocumentSnapshot userDocSnap = await _users.doc(uid).get();

  //     if (!userDocSnap.exists) {
  //       await _users.doc(uid).set({
  //         'uid': uid,
  //         'email': googleSignInAccount.email,
  //         'accountCreationDate': FieldValue.serverTimestamp(),
  //         'profileImageUrl': AppStrings.noImageProfileUrl,
  //         'name': generateUsername(googleSignInAccount.email),
  //       });
  //     }
  //   } catch (e) {
  //     logger.e(e.toString());
  //     throw AppStrings.errorTextGoogleSignIn;
  //   }
  // }

  // Future<void> signInWithApple() async {
  //   try {
  //     final AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );

  //     final OAuthCredential authCredential = OAuthProvider('apple.com').credential(
  //       idToken: credential.identityToken,
  //       accessToken: credential.authorizationCode,
  //     );

  //     UserCredential userCredential = await _auth.signInWithCredential(authCredential);

  //     // Check if the Firebase user is not null before accessing UID.
  //     if (userCredential.user == null) {
  //       throw Exception('Failed to obtain Firebase user after Apple sign in.');
  //     }

  //     String uid = userCredential.user!.uid; // Using '!' as we've checked it's not null above.

  //     // Get email, if credential.email is null or empty, then fetch from userCredential.user.email
  //     String email = (credential.email != null && credential.email!.isNotEmpty)
  //         ? credential.email!
  //         : (userCredential.user!.email ?? 'no-email@relay.appleid.com');

  //     DocumentSnapshot userDocSnap = await _users.doc(uid).get();

  //     if (!userDocSnap.exists) {
  //       await _users.doc(uid).set({
  //         'uid': uid,
  //         'email': email,
  //         'accountCreationDate': FieldValue.serverTimestamp(),
  //         'profileImageUrl': AppStrings.noImageProfileUrl,
  //         'name': generateUsername(email),
  //       });
  //     }
  //   } catch (e) {
  //     logger.e(e.toString());
  //     throw AppStrings.errorTextAppleSignIn;
  //   }
  // }

  Future<void> reloadUser() async {
    try {
      await _auth.currentUser?.reload();
    } catch (e) {
      logger.e(e.toString());
      throw 'Error on reload user';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      logger.e(e.toString());
      throw "Email can't be sendet";
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      logger.e(e.toString());
      throw 'Error on reset password';
    }
  }

  Future<void> signOut() async {
    try {
      // await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      logger.e(e.toString());
      throw 'error on sign out';
    }
  }

  // Future<void> deleteUser({String? password}) async {
  //   try {
  //     //Before deleting account user needs to login again
  //     String? userLoginService = getAuthProvider();
  //     if (userLoginService == 'password') {
  //       await signInWithEmailAndPassword(
  //         email: _auth.currentUser?.email ?? '',
  //         password: password ?? '',
  //       );
  //     } else if (userLoginService == 'google.com') {
  //       await signInWithGoogle();
  //     } else if (userLoginService == 'apple.com') {
  //       await signInWithApple();
  //     }

  //     List<Future<void>> deletionTasks = [];

  //     if (userLoginService == 'google.com') {
  //       deletionTasks.add(_googleSignIn.signOut());
  //     }

  //     // Schedule the Firebase authentication user deletion
  //     if (_auth.currentUser != null) {
  //       deletionTasks.add(_auth.currentUser!.delete());
  //     }

  //     // Schedule the Firestore user data deletion
  //     deletionTasks.add(_users.doc(_auth.currentUser?.uid).delete());

  //     // Wait for all deletion tasks to complete
  //     await Future.wait(deletionTasks);
  //   } catch (e) {
  //     logger.e(e.toString());
  //     throw AppStrings.errorTextDeleteUser;
  //   }
  // }
}
