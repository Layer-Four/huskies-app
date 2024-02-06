// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  bool get activePlayer => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  Team get currentTeam => throw _privateConstructorUsedError;
  int get goals => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get playerNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call(
      {bool activePlayer,
      int age,
      Team currentTeam,
      int goals,
      String name,
      int playerNumber});

  $TeamCopyWith<$Res> get currentTeam;
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activePlayer = null,
    Object? age = null,
    Object? currentTeam = null,
    Object? goals = null,
    Object? name = null,
    Object? playerNumber = null,
  }) {
    return _then(_value.copyWith(
      activePlayer: null == activePlayer
          ? _value.activePlayer
          : activePlayer // ignore: cast_nullable_to_non_nullable
              as bool,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      currentTeam: null == currentTeam
          ? _value.currentTeam
          : currentTeam // ignore: cast_nullable_to_non_nullable
              as Team,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      playerNumber: null == playerNumber
          ? _value.playerNumber
          : playerNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get currentTeam {
    return $TeamCopyWith<$Res>(_value.currentTeam, (value) {
      return _then(_value.copyWith(currentTeam: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
          _$PlayerImpl value, $Res Function(_$PlayerImpl) then) =
      __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool activePlayer,
      int age,
      Team currentTeam,
      int goals,
      String name,
      int playerNumber});

  @override
  $TeamCopyWith<$Res> get currentTeam;
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
      _$PlayerImpl _value, $Res Function(_$PlayerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activePlayer = null,
    Object? age = null,
    Object? currentTeam = null,
    Object? goals = null,
    Object? name = null,
    Object? playerNumber = null,
  }) {
    return _then(_$PlayerImpl(
      activePlayer: null == activePlayer
          ? _value.activePlayer
          : activePlayer // ignore: cast_nullable_to_non_nullable
              as bool,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      currentTeam: null == currentTeam
          ? _value.currentTeam
          : currentTeam // ignore: cast_nullable_to_non_nullable
              as Team,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      playerNumber: null == playerNumber
          ? _value.playerNumber
          : playerNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerImpl implements _Player {
  const _$PlayerImpl(
      {required this.activePlayer,
      required this.age,
      required this.currentTeam,
      required this.goals,
      required this.name,
      required this.playerNumber});

  factory _$PlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerImplFromJson(json);

  @override
  final bool activePlayer;
  @override
  final int age;
  @override
  final Team currentTeam;
  @override
  final int goals;
  @override
  final String name;
  @override
  final int playerNumber;

  @override
  String toString() {
    return 'Player(activePlayer: $activePlayer, age: $age, currentTeam: $currentTeam, goals: $goals, name: $name, playerNumber: $playerNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.activePlayer, activePlayer) ||
                other.activePlayer == activePlayer) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.currentTeam, currentTeam) ||
                other.currentTeam == currentTeam) &&
            (identical(other.goals, goals) || other.goals == goals) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.playerNumber, playerNumber) ||
                other.playerNumber == playerNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, activePlayer, age, currentTeam, goals, name, playerNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerImplToJson(
      this,
    );
  }
}

abstract class _Player implements Player {
  const factory _Player(
      {required final bool activePlayer,
      required final int age,
      required final Team currentTeam,
      required final int goals,
      required final String name,
      required final int playerNumber}) = _$PlayerImpl;

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  bool get activePlayer;
  @override
  int get age;
  @override
  Team get currentTeam;
  @override
  int get goals;
  @override
  String get name;
  @override
  int get playerNumber;
  @override
  @JsonKey(ignore: true)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
