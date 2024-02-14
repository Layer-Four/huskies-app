import 'package:flutter_test/flutter_test.dart';
import 'package:huskies_app/models/user_vm/user_model.dart';

void main() {
  const uID = '08151234567';
  final testUser = UserModel(
    uID: uID,
    displayedName: 'test,Nutzer',
    email: 'example@email.mail',
    phoneNumber: 08151234567,
    userImageUrl: 'https://testImage.com',
    appUserID: 100000000000,
  );
  final testUserToJson = testUser.toJson();
  final testUserFromJson = UserModel.fromJson(testUserToJson);
  final ownFromJsonUser = UserModel(
    displayedName: testUserToJson['displayedName'],
    email: testUserToJson['email'],
    phoneNumber: testUserToJson['phoneNumber'],
    uID: testUserToJson['uID'],
    userImageUrl: testUserToJson['userImageUrl'],
    appUserID: testUserToJson['appUserID'],
  );
  test('create UserModel', () {
    expect(testUser.appUserID, 100000000000);
    expect(testUser.displayedName, 'test,Nutzer');
    expect(testUser.email, 'example@email.mail');
    expect(testUser.phoneNumber, 08151234567);
    expect(testUser.uID, '08151234567');
    expect(testUser.userImageUrl, 'https://testImage.com');
  });
  test('user -> toJson()-> fromJson(->UserModel)', () {
    expect(testUserFromJson, testUser);
    expect(testUserToJson.length, 6);
    expect(testUserFromJson, ownFromJsonUser);
  });
  test('create user Without uID and create user with uID', () {
    final testUserToJsonWithoutUID = testUserToJson;
    testUserToJsonWithoutUID.remove('uID');
    expect(testUserToJsonWithoutUID.length, 5);
    expect(testUserToJsonWithoutUID.containsKey('uID'), false);
    expect(testUserFromJson, ownFromJsonUser);
  });
}
