// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get displayedName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get phoneNumber => throw _privateConstructorUsedError;
  String get uID => throw _privateConstructorUsedError;
  String? get userImageUrl => throw _privateConstructorUsedError;
  int? get appUserID => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  FieldValue? get accountCreationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? displayedName,
      String? email,
      int? phoneNumber,
      String uID,
      String? userImageUrl,
      int? appUserID,
      @JsonKey(includeFromJson: false, includeToJson: false)
      FieldValue? accountCreationDate});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayedName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? uID = null,
    Object? userImageUrl = freezed,
    Object? appUserID = freezed,
    Object? accountCreationDate = freezed,
  }) {
    return _then(_value.copyWith(
      displayedName: freezed == displayedName
          ? _value.displayedName
          : displayedName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      uID: null == uID
          ? _value.uID
          : uID // ignore: cast_nullable_to_non_nullable
              as String,
      userImageUrl: freezed == userImageUrl
          ? _value.userImageUrl
          : userImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      appUserID: freezed == appUserID
          ? _value.appUserID
          : appUserID // ignore: cast_nullable_to_non_nullable
              as int?,
      accountCreationDate: freezed == accountCreationDate
          ? _value.accountCreationDate
          : accountCreationDate // ignore: cast_nullable_to_non_nullable
              as FieldValue?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? displayedName,
      String? email,
      int? phoneNumber,
      String uID,
      String? userImageUrl,
      int? appUserID,
      @JsonKey(includeFromJson: false, includeToJson: false)
      FieldValue? accountCreationDate});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayedName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? uID = null,
    Object? userImageUrl = freezed,
    Object? appUserID = freezed,
    Object? accountCreationDate = freezed,
  }) {
    return _then(_$UserModelImpl(
      displayedName: freezed == displayedName
          ? _value.displayedName
          : displayedName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      uID: null == uID
          ? _value.uID
          : uID // ignore: cast_nullable_to_non_nullable
              as String,
      userImageUrl: freezed == userImageUrl
          ? _value.userImageUrl
          : userImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      appUserID: freezed == appUserID
          ? _value.appUserID
          : appUserID // ignore: cast_nullable_to_non_nullable
              as int?,
      accountCreationDate: freezed == accountCreationDate
          ? _value.accountCreationDate
          : accountCreationDate // ignore: cast_nullable_to_non_nullable
              as FieldValue?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {this.displayedName,
      this.email,
      this.phoneNumber,
      required this.uID,
      this.userImageUrl,
      this.appUserID,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.accountCreationDate});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String? displayedName;
  @override
  final String? email;
  @override
  final int? phoneNumber;
  @override
  final String uID;
  @override
  final String? userImageUrl;
  @override
  final int? appUserID;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final FieldValue? accountCreationDate;

  @override
  String toString() {
    return 'UserModel(displayedName: $displayedName, email: $email, phoneNumber: $phoneNumber, uID: $uID, userImageUrl: $userImageUrl, appUserID: $appUserID, accountCreationDate: $accountCreationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.displayedName, displayedName) ||
                other.displayedName == displayedName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.uID, uID) || other.uID == uID) &&
            (identical(other.userImageUrl, userImageUrl) ||
                other.userImageUrl == userImageUrl) &&
            (identical(other.appUserID, appUserID) ||
                other.appUserID == appUserID) &&
            (identical(other.accountCreationDate, accountCreationDate) ||
                other.accountCreationDate == accountCreationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayedName, email,
      phoneNumber, uID, userImageUrl, appUserID, accountCreationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {final String? displayedName,
      final String? email,
      final int? phoneNumber,
      required final String uID,
      final String? userImageUrl,
      final int? appUserID,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final FieldValue? accountCreationDate}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String? get displayedName;
  @override
  String? get email;
  @override
  int? get phoneNumber;
  @override
  String get uID;
  @override
  String? get userImageUrl;
  @override
  int? get appUserID;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  FieldValue? get accountCreationDate;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
