import 'dart:developer';
// ignore: unused_import
import 'dart:io';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/models/user_vm/user_model.dart';
import 'package:huskies_app/provider/error_provider/error_provider.dart';

class UserNotifier extends Notifier<UserModel> {
  final CollectionReference _usersDB = FirebaseFirestore.instance.collection('users');
  final Reference _storageRef = FirebaseStorage.instance.ref();

  @override
  UserModel build() {
    return UserModel(uID: 'fake');
  }

  //TODO: change user to the FireStore API and load userData from firestore
  Future<void> initUser(String uID) async {
    try {
      final user = await _usersDB.doc(uID).get();
      final json = user.data();
      log(json.toString());
      // final x = UserModel(uID: json ,email: user.);

      final dbUser = UserModel.fromJson(user.data() as Map<String, dynamic>);
      UserModel userWithKuNr = dbUser;
      if (dbUser.appUserID == null) {
        userWithKuNr = dbUser.copyWith(appUserID: math.Random().nextInt(89999999999) + 1000000000);
        final Map<String, dynamic> json = userWithKuNr.toJson().remove('uID');
        if (json.containsKey('uID')) {
          throw 'remove uID from json because, we don`t need it twice in Database';
        }
        _usersDB.doc(uID).set(json);
        state = dbUser;
      }
      if (userWithKuNr.appUserID != null) state = userWithKuNr;
      return;
    } catch (e) {
      ref.read(errorProvider.notifier).catchError('initUser is failed-> $e');
    }
  }

  void updateUser({String? displayName, String? newEmail, int? newPhoneNumber, File? image}) async {
    final user = state;
    if (user.uID == 'fake') {
      ref.read(errorProvider.notifier).catchError('No user created before edit user');
    }
    String imageURL = '';
    try {
      if (image != null) {
        final dbRef = _storageRef.child('users').child(user.uID).child('profileImageUrl');
        await dbRef.putFile(image);
        imageURL = await dbRef.getDownloadURL();

        final newUser = user.copyWith(
          displayedName: displayName,
          email: newEmail,
          phoneNumber: newPhoneNumber,
          userImageUrl: imageURL,
        );
        saveUserProfile(user: newUser);
      }
      return;
    } catch (e) {
      ref.read(errorProvider.notifier).catchError(e.toString());
    }
  }

  Future<void> editUserProfile({
    required String userUid,
    required String name,
    required File? profileImageFile,
  }) async {
    String? profileImageUrl;
    final user = state;
    if (user.uID == 'fake') {
      ref.read(errorProvider.notifier).catchError('No user created before edit user');
    }
    try {
      // ! Check this function.
      final ref = _storageRef.child('users').child(userUid).child('profileImageUrl');
      if (profileImageFile != null) {
        await ref.putFile(profileImageFile);
        profileImageUrl = await ref.getDownloadURL();
      }
      final updatedUser = user.copyWith(displayedName: name, userImageUrl: profileImageUrl);
      saveUserProfile(user: updatedUser);
    } catch (e) {
      rethrow;
    }
    //  (
    //   userUid: userUid,
    //   name: name,
    //   profileImageUrl: profileImageUrl,
    // );
  }

  Future<void> saveUserProfile({required UserModel user}) async {
    try {
      final json = user.toJson();
      json.remove('uID');
      if (json.containsKey('uID')) {
        log('$json');
        ref
            .read(errorProvider.notifier)
            .catchError('remove uID from json because, we don`t need it twice in Database');
      }
      await _usersDB.doc(user.uID).set(json, SetOptions(merge: true));
    } catch (e) {
      log(e.toString());
      ref.read(errorProvider.notifier).catchError('errorSavingUserProfile');
    }
  }
}
