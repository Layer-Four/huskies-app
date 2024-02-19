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

class UserNotifier extends Notifier<UserModel?> {
  final CollectionReference _usersDB = FirebaseFirestore.instance.collection('users');
  final Reference _storageRef = FirebaseStorage.instance.ref();

  @override
  UserModel? build() {
    return null;
  }

  Future<void> initUser(String uID) async {
    UserModel? dbUser;
    try {
      final userSnapshot = await _usersDB.doc(uID).get();
      final Map<String, dynamic>? json = userSnapshot.data() as Map<String, dynamic>?;
      if (json != null) {
        dbUser = UserModel(
          displayedName: json['displayedName'],
          email: json['email'],
          phoneNumber: json['phoneNumber'],
          uID: uID,
          userImageUrl: json['userImageUrl'],
          appUserID: json['appUserID'],
        );
      }
      if (dbUser != null) {
        if (dbUser.appUserID == null) {
          final userWithKuNr =
              dbUser.copyWith(appUserID: math.Random().nextInt(899999999) + 100000000);
          final json = userWithKuNr.toJson();
          json.remove('uID');
          if (!json.containsKey('uID')) {
            _usersDB.doc(uID).set(json);
            state = userWithKuNr;
            return;
          }
          ref.read(errorProvider.notifier).catchError(
                throw 'remove uID from json because, we don`t need it twice in Database',
              );
        }
      }
      return;
    } catch (e) {
      ref.read(errorProvider.notifier).catchError('initUser is failed-> $e');
    }
  }

  void updateUserProfile({
    String? displayName,
    String? newEmail,
    int? newPhoneNumber,
    File? image,
  }) async {
    if (state == null) {
      ref.read(errorProvider.notifier).catchError(
            throw ('No user created before edit user'),
          );
    } else {
      try {
        String? imageURL;
        if (image != null) {
          final dbRef = _storageRef.child('users').child(state!.uID).child('profileImageUrl');
          await dbRef.putFile(image);
          imageURL = await dbRef.getDownloadURL();
        }
        final newUser = UserModel(
          appUserID: state!.appUserID ?? math.Random().nextInt(899999999) + 100000000,
          uID: state!.uID,
          displayedName: displayName ?? state!.displayedName,
          email: newEmail ?? state!.email,
          phoneNumber: newPhoneNumber ?? state!.phoneNumber,
          userImageUrl: imageURL ?? state!.userImageUrl,
        );
        saveUserProfile(user: newUser);
        state = newUser;
        return;
      } catch (e) {
        ref.read(errorProvider.notifier).catchError(e.toString());
      }
    }
  }

  void saveUserProfile({required UserModel user}) {
    try {
      final json = user.toJson();
      json.remove('uID');
      if (json.containsKey('uID')) {
        log('$json');
        ref.read(errorProvider.notifier).catchError(
            throw Exception('remove uID from json because, we don`t need it twice in Database'));
      }
      _usersDB.doc(user.uID).set(json, SetOptions(merge: true));
    } catch (e) {
      log(e.toString());
      ref.read(errorProvider.notifier).catchError(throw Exception('errorSavingUserProfile'));
    }
  }
}
