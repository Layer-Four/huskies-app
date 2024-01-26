import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserModel {
  final String email;
  final bool hasPaymentData;
  final bool isLogIn;
  final String? firstName;
  final String? name;
  final String uID;
  final String? profileImage;
  final List<String>? itemTokens;
  const UserModel({
    required this.email,
    this.hasPaymentData = false,
    this.isLogIn = false,
    this.itemTokens,
    this.firstName,
    this.name,
    this.profileImage,
    required this.uID,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
