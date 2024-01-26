// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Matches _$MatchesFromJson(Map<String, dynamic> json) {
  return _Matches.fromJson(json);
}

/// @nodoc
mixin _$Matches {
  String? get endScore => throw _privateConstructorUsedError;
  GameReport? get gameReport => throw _privateConstructorUsedError;
  Map<dynamic, dynamic>? get goals => throw _privateConstructorUsedError;
  Team? get home => throw _privateConstructorUsedError;
  Team? get visitor => throw _privateConstructorUsedError;
  Team? get winner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchesCopyWith<Matches> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesCopyWith<$Res> {
  factory $MatchesCopyWith(Matches value, $Res Function(Matches) then) =
      _$MatchesCopyWithImpl<$Res, Matches>;
  @useResult
  $Res call(
      {String? endScore,
      GameReport? gameReport,
      Map<dynamic, dynamic>? goals,
      Team? home,
      Team? visitor,
      Team? winner});

  $GameReportCopyWith<$Res>? get gameReport;
  $TeamCopyWith<$Res>? get home;
  $TeamCopyWith<$Res>? get visitor;
  $TeamCopyWith<$Res>? get winner;
}

/// @nodoc
class _$MatchesCopyWithImpl<$Res, $Val extends Matches>
    implements $MatchesCopyWith<$Res> {
  _$MatchesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endScore = freezed,
    Object? gameReport = freezed,
    Object? goals = freezed,
    Object? home = freezed,
    Object? visitor = freezed,
    Object? winner = freezed,
  }) {
    return _then(_value.copyWith(
      endScore: freezed == endScore
          ? _value.endScore
          : endScore // ignore: cast_nullable_to_non_nullable
              as String?,
      gameReport: freezed == gameReport
          ? _value.gameReport
          : gameReport // ignore: cast_nullable_to_non_nullable
              as GameReport?,
      goals: freezed == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      home: freezed == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as Team?,
      visitor: freezed == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as Team?,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as Team?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameReportCopyWith<$Res>? get gameReport {
    if (_value.gameReport == null) {
      return null;
    }

    return $GameReportCopyWith<$Res>(_value.gameReport!, (value) {
      return _then(_value.copyWith(gameReport: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get home {
    if (_value.home == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.home!, (value) {
      return _then(_value.copyWith(home: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get visitor {
    if (_value.visitor == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.visitor!, (value) {
      return _then(_value.copyWith(visitor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get winner {
    if (_value.winner == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.winner!, (value) {
      return _then(_value.copyWith(winner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchesImplCopyWith<$Res> implements $MatchesCopyWith<$Res> {
  factory _$$MatchesImplCopyWith(
          _$MatchesImpl value, $Res Function(_$MatchesImpl) then) =
      __$$MatchesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? endScore,
      GameReport? gameReport,
      Map<dynamic, dynamic>? goals,
      Team? home,
      Team? visitor,
      Team? winner});

  @override
  $GameReportCopyWith<$Res>? get gameReport;
  @override
  $TeamCopyWith<$Res>? get home;
  @override
  $TeamCopyWith<$Res>? get visitor;
  @override
  $TeamCopyWith<$Res>? get winner;
}

/// @nodoc
class __$$MatchesImplCopyWithImpl<$Res>
    extends _$MatchesCopyWithImpl<$Res, _$MatchesImpl>
    implements _$$MatchesImplCopyWith<$Res> {
  __$$MatchesImplCopyWithImpl(
      _$MatchesImpl _value, $Res Function(_$MatchesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endScore = freezed,
    Object? gameReport = freezed,
    Object? goals = freezed,
    Object? home = freezed,
    Object? visitor = freezed,
    Object? winner = freezed,
  }) {
    return _then(_$MatchesImpl(
      endScore: freezed == endScore
          ? _value.endScore
          : endScore // ignore: cast_nullable_to_non_nullable
              as String?,
      gameReport: freezed == gameReport
          ? _value.gameReport
          : gameReport // ignore: cast_nullable_to_non_nullable
              as GameReport?,
      goals: freezed == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      home: freezed == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as Team?,
      visitor: freezed == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as Team?,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as Team?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchesImpl implements _Matches {
  const _$MatchesImpl(
      {this.endScore,
      this.gameReport,
      final Map<dynamic, dynamic>? goals,
      this.home,
      this.visitor,
      this.winner})
      : _goals = goals;

  factory _$MatchesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchesImplFromJson(json);

  @override
  final String? endScore;
  @override
  final GameReport? gameReport;
  final Map<dynamic, dynamic>? _goals;
  @override
  Map<dynamic, dynamic>? get goals {
    final value = _goals;
    if (value == null) return null;
    if (_goals is EqualUnmodifiableMapView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final Team? home;
  @override
  final Team? visitor;
  @override
  final Team? winner;

  @override
  String toString() {
    return 'Matches(endScore: $endScore, gameReport: $gameReport, goals: $goals, home: $home, visitor: $visitor, winner: $winner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesImpl &&
            (identical(other.endScore, endScore) ||
                other.endScore == endScore) &&
            (identical(other.gameReport, gameReport) ||
                other.gameReport == gameReport) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.visitor, visitor) || other.visitor == visitor) &&
            (identical(other.winner, winner) || other.winner == winner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, endScore, gameReport,
      const DeepCollectionEquality().hash(_goals), home, visitor, winner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesImplCopyWith<_$MatchesImpl> get copyWith =>
      __$$MatchesImplCopyWithImpl<_$MatchesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchesImplToJson(
      this,
    );
  }
}

abstract class _Matches implements Matches {
  const factory _Matches(
      {final String? endScore,
      final GameReport? gameReport,
      final Map<dynamic, dynamic>? goals,
      final Team? home,
      final Team? visitor,
      final Team? winner}) = _$MatchesImpl;

  factory _Matches.fromJson(Map<String, dynamic> json) = _$MatchesImpl.fromJson;

  @override
  String? get endScore;
  @override
  GameReport? get gameReport;
  @override
  Map<dynamic, dynamic>? get goals;
  @override
  Team? get home;
  @override
  Team? get visitor;
  @override
  Team? get winner;
  @override
  @JsonKey(ignore: true)
  _$$MatchesImplCopyWith<_$MatchesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
