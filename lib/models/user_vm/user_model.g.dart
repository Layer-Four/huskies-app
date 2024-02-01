// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      displayedName: json['displayedName'] as String?,
      email: json['email'] as String,
      emailVerified: json['emailVerified'] ?? false,
      phoneNumber: json['phoneNumber'] as int?,
      tenantID: json['tenantID'] as String?,
      uID: json['uID'] as String,
      userImage: json['userImage'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'displayedName': instance.displayedName,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'phoneNumber': instance.phoneNumber,
      'tenantID': instance.tenantID,
      'uID': instance.uID,
      'userImage': instance.userImage,
    };
