// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      displayedName: json['displayedName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as int?,
      uID: json['uID'] as String,
      userImageUrl: json['userImageUrl'] as String?,
      appUserID: json['appUserID'] as int?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'displayedName': instance.displayedName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'uID': instance.uID,
      'userImageUrl': instance.userImageUrl,
      'appUserID': instance.appUserID,
    };
