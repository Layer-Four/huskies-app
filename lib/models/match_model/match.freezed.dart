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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Matches _$MatchesFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _Matches.fromJson(json);
    case 'pastMatch':
      return PastMatch.fromJson(json);
    case 'nextMatch':
      return NextMatch.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Matches',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Matches {
  Team? get home => throw _privateConstructorUsedError;
  Team? get visitor => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)
        $default, {
    required TResult Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)
        pastMatch,
    required TResult Function(Team home, Team visitor) nextMatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)?
        $default, {
    TResult? Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)?
        pastMatch,
    TResult? Function(Team home, Team visitor)? nextMatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)?
        $default, {
    TResult Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)?
        pastMatch,
    TResult Function(Team home, Team visitor)? nextMatch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Matches value) $default, {
    required TResult Function(PastMatch value) pastMatch,
    required TResult Function(NextMatch value) nextMatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Matches value)? $default, {
    TResult? Function(PastMatch value)? pastMatch,
    TResult? Function(NextMatch value)? nextMatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Matches value)? $default, {
    TResult Function(PastMatch value)? pastMatch,
    TResult Function(NextMatch value)? nextMatch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchesCopyWith<Matches> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesCopyWith<$Res> {
  factory $MatchesCopyWith(Matches value, $Res Function(Matches) then) =
      _$MatchesCopyWithImpl<$Res, Matches>;
  @useResult
  $Res call({Team home, Team visitor});

  $TeamCopyWith<$Res>? get home;
  $TeamCopyWith<$Res>? get visitor;
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
    Object? home = null,
    Object? visitor = null,
  }) {
    return _then(_value.copyWith(
      home: null == home
          ? _value.home!
          : home // ignore: cast_nullable_to_non_nullable
              as Team,
      visitor: null == visitor
          ? _value.visitor!
          : visitor // ignore: cast_nullable_to_non_nullable
              as Team,
    ) as $Val);
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
      List<(int, String)?> gameReport,
      Map<dynamic, dynamic>? goals,
      Team? home,
      Team? visitor,
      Team? winner});

  @override
  $TeamCopyWith<$Res>? get home;
  @override
  $TeamCopyWith<$Res>? get visitor;
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
    Object? gameReport = null,
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
      gameReport: null == gameReport
          ? _value._gameReport
          : gameReport // ignore: cast_nullable_to_non_nullable
              as List<(int, String)?>,
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

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get winner {
    if (_value.winner == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.winner!, (value) {
      return _then(_value.copyWith(winner: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchesImpl implements _Matches {
  const _$MatchesImpl(
      {this.endScore,
      required final List<(int, String)?> gameReport,
      final Map<dynamic, dynamic>? goals,
      this.home,
      this.visitor,
      this.winner,
      final String? $type})
      : _gameReport = gameReport,
        _goals = goals,
        $type = $type ?? 'default';

  factory _$MatchesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchesImplFromJson(json);

  @override
  final String? endScore;
  final List<(int, String)?> _gameReport;
  @override
  List<(int, String)?> get gameReport {
    if (_gameReport is EqualUnmodifiableListView) return _gameReport;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gameReport);
  }

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

  @JsonKey(name: 'runtimeType')
  final String $type;

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
            const DeepCollectionEquality()
                .equals(other._gameReport, _gameReport) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.visitor, visitor) || other.visitor == visitor) &&
            (identical(other.winner, winner) || other.winner == winner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      endScore,
      const DeepCollectionEquality().hash(_gameReport),
      const DeepCollectionEquality().hash(_goals),
      home,
      visitor,
      winner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesImplCopyWith<_$MatchesImpl> get copyWith =>
      __$$MatchesImplCopyWithImpl<_$MatchesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)
        $default, {
    required TResult Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)
        pastMatch,
    required TResult Function(Team home, Team visitor) nextMatch,
  }) {
    return $default(endScore, gameReport, goals, home, visitor, winner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)?
        $default, {
    TResult? Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)?
        pastMatch,
    TResult? Function(Team home, Team visitor)? nextMatch,
  }) {
    return $default?.call(endScore, gameReport, goals, home, visitor, winner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)?
        $default, {
    TResult Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)?
        pastMatch,
    TResult Function(Team home, Team visitor)? nextMatch,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(endScore, gameReport, goals, home, visitor, winner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Matches value) $default, {
    required TResult Function(PastMatch value) pastMatch,
    required TResult Function(NextMatch value) nextMatch,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Matches value)? $default, {
    TResult? Function(PastMatch value)? pastMatch,
    TResult? Function(NextMatch value)? nextMatch,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Matches value)? $default, {
    TResult Function(PastMatch value)? pastMatch,
    TResult Function(NextMatch value)? nextMatch,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

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
      required final List<(int, String)?> gameReport,
      final Map<dynamic, dynamic>? goals,
      final Team? home,
      final Team? visitor,
      final Team? winner}) = _$MatchesImpl;

  factory _Matches.fromJson(Map<String, dynamic> json) = _$MatchesImpl.fromJson;

  String? get endScore;
  List<(int, String)?> get gameReport;
  Map<dynamic, dynamic>? get goals;
  @override
  Team? get home;
  @override
  Team? get visitor;
  Team? get winner;
  @override
  @JsonKey(ignore: true)
  _$$MatchesImplCopyWith<_$MatchesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PastMatchImplCopyWith<$Res>
    implements $MatchesCopyWith<$Res> {
  factory _$$PastMatchImplCopyWith(
          _$PastMatchImpl value, $Res Function(_$PastMatchImpl) then) =
      __$$PastMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String endScore,
      List<(int, String)> gameReports,
      Map<dynamic, dynamic> goals,
      Team home,
      Team visitor,
      Team winner});

  @override
  $TeamCopyWith<$Res> get home;
  @override
  $TeamCopyWith<$Res> get visitor;
  $TeamCopyWith<$Res> get winner;
}

/// @nodoc
class __$$PastMatchImplCopyWithImpl<$Res>
    extends _$MatchesCopyWithImpl<$Res, _$PastMatchImpl>
    implements _$$PastMatchImplCopyWith<$Res> {
  __$$PastMatchImplCopyWithImpl(
      _$PastMatchImpl _value, $Res Function(_$PastMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endScore = null,
    Object? gameReports = null,
    Object? goals = null,
    Object? home = null,
    Object? visitor = null,
    Object? winner = null,
  }) {
    return _then(_$PastMatchImpl(
      endScore: null == endScore
          ? _value.endScore
          : endScore // ignore: cast_nullable_to_non_nullable
              as String,
      gameReports: null == gameReports
          ? _value._gameReports
          : gameReports // ignore: cast_nullable_to_non_nullable
              as List<(int, String)>,
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as Team,
      visitor: null == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as Team,
      winner: null == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as Team,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get home {
    return $TeamCopyWith<$Res>(_value.home, (value) {
      return _then(_value.copyWith(home: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get visitor {
    return $TeamCopyWith<$Res>(_value.visitor, (value) {
      return _then(_value.copyWith(visitor: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get winner {
    return $TeamCopyWith<$Res>(_value.winner, (value) {
      return _then(_value.copyWith(winner: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$PastMatchImpl implements PastMatch {
  _$PastMatchImpl(
      {required this.endScore,
      required final List<(int, String)> gameReports,
      required final Map<dynamic, dynamic> goals,
      required this.home,
      required this.visitor,
      required this.winner,
      final String? $type})
      : _gameReports = gameReports,
        _goals = goals,
        $type = $type ?? 'pastMatch';

  factory _$PastMatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$PastMatchImplFromJson(json);

  @override
  final String endScore;
  final List<(int, String)> _gameReports;
  @override
  List<(int, String)> get gameReports {
    if (_gameReports is EqualUnmodifiableListView) return _gameReports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gameReports);
  }

  final Map<dynamic, dynamic> _goals;
  @override
  Map<dynamic, dynamic> get goals {
    if (_goals is EqualUnmodifiableMapView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_goals);
  }

  @override
  final Team home;
  @override
  final Team visitor;
  @override
  final Team winner;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Matches.pastMatch(endScore: $endScore, gameReports: $gameReports, goals: $goals, home: $home, visitor: $visitor, winner: $winner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PastMatchImpl &&
            (identical(other.endScore, endScore) ||
                other.endScore == endScore) &&
            const DeepCollectionEquality()
                .equals(other._gameReports, _gameReports) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.visitor, visitor) || other.visitor == visitor) &&
            (identical(other.winner, winner) || other.winner == winner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      endScore,
      const DeepCollectionEquality().hash(_gameReports),
      const DeepCollectionEquality().hash(_goals),
      home,
      visitor,
      winner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PastMatchImplCopyWith<_$PastMatchImpl> get copyWith =>
      __$$PastMatchImplCopyWithImpl<_$PastMatchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)
        $default, {
    required TResult Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)
        pastMatch,
    required TResult Function(Team home, Team visitor) nextMatch,
  }) {
    return pastMatch(endScore, gameReports, goals, home, visitor, winner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)?
        $default, {
    TResult? Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)?
        pastMatch,
    TResult? Function(Team home, Team visitor)? nextMatch,
  }) {
    return pastMatch?.call(endScore, gameReports, goals, home, visitor, winner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)?
        $default, {
    TResult Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)?
        pastMatch,
    TResult Function(Team home, Team visitor)? nextMatch,
    required TResult orElse(),
  }) {
    if (pastMatch != null) {
      return pastMatch(endScore, gameReports, goals, home, visitor, winner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Matches value) $default, {
    required TResult Function(PastMatch value) pastMatch,
    required TResult Function(NextMatch value) nextMatch,
  }) {
    return pastMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Matches value)? $default, {
    TResult? Function(PastMatch value)? pastMatch,
    TResult? Function(NextMatch value)? nextMatch,
  }) {
    return pastMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Matches value)? $default, {
    TResult Function(PastMatch value)? pastMatch,
    TResult Function(NextMatch value)? nextMatch,
    required TResult orElse(),
  }) {
    if (pastMatch != null) {
      return pastMatch(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PastMatchImplToJson(
      this,
    );
  }
}

abstract class PastMatch implements Matches {
  factory PastMatch(
      {required final String endScore,
      required final List<(int, String)> gameReports,
      required final Map<dynamic, dynamic> goals,
      required final Team home,
      required final Team visitor,
      required final Team winner}) = _$PastMatchImpl;

  factory PastMatch.fromJson(Map<String, dynamic> json) =
      _$PastMatchImpl.fromJson;

  String get endScore;
  List<(int, String)> get gameReports;
  Map<dynamic, dynamic> get goals;
  @override
  Team get home;
  @override
  Team get visitor;
  Team get winner;
  @override
  @JsonKey(ignore: true)
  _$$PastMatchImplCopyWith<_$PastMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NextMatchImplCopyWith<$Res>
    implements $MatchesCopyWith<$Res> {
  factory _$$NextMatchImplCopyWith(
          _$NextMatchImpl value, $Res Function(_$NextMatchImpl) then) =
      __$$NextMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Team home, Team visitor});

  @override
  $TeamCopyWith<$Res> get home;
  @override
  $TeamCopyWith<$Res> get visitor;
}

/// @nodoc
class __$$NextMatchImplCopyWithImpl<$Res>
    extends _$MatchesCopyWithImpl<$Res, _$NextMatchImpl>
    implements _$$NextMatchImplCopyWith<$Res> {
  __$$NextMatchImplCopyWithImpl(
      _$NextMatchImpl _value, $Res Function(_$NextMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? visitor = null,
  }) {
    return _then(_$NextMatchImpl(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as Team,
      visitor: null == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as Team,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get home {
    return $TeamCopyWith<$Res>(_value.home, (value) {
      return _then(_value.copyWith(home: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get visitor {
    return $TeamCopyWith<$Res>(_value.visitor, (value) {
      return _then(_value.copyWith(visitor: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$NextMatchImpl implements NextMatch {
  _$NextMatchImpl(
      {required this.home, required this.visitor, final String? $type})
      : $type = $type ?? 'nextMatch';

  factory _$NextMatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$NextMatchImplFromJson(json);

  @override
  final Team home;
  @override
  final Team visitor;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Matches.nextMatch(home: $home, visitor: $visitor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextMatchImpl &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.visitor, visitor) || other.visitor == visitor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, home, visitor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextMatchImplCopyWith<_$NextMatchImpl> get copyWith =>
      __$$NextMatchImplCopyWithImpl<_$NextMatchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)
        $default, {
    required TResult Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)
        pastMatch,
    required TResult Function(Team home, Team visitor) nextMatch,
  }) {
    return nextMatch(home, visitor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)?
        $default, {
    TResult? Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)?
        pastMatch,
    TResult? Function(Team home, Team visitor)? nextMatch,
  }) {
    return nextMatch?.call(home, visitor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? endScore,
            List<(int, String)?> gameReport,
            Map<dynamic, dynamic>? goals,
            Team? home,
            Team? visitor,
            Team? winner)?
        $default, {
    TResult Function(String endScore, List<(int, String)> gameReports,
            Map<dynamic, dynamic> goals, Team home, Team visitor, Team winner)?
        pastMatch,
    TResult Function(Team home, Team visitor)? nextMatch,
    required TResult orElse(),
  }) {
    if (nextMatch != null) {
      return nextMatch(home, visitor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Matches value) $default, {
    required TResult Function(PastMatch value) pastMatch,
    required TResult Function(NextMatch value) nextMatch,
  }) {
    return nextMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Matches value)? $default, {
    TResult? Function(PastMatch value)? pastMatch,
    TResult? Function(NextMatch value)? nextMatch,
  }) {
    return nextMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Matches value)? $default, {
    TResult Function(PastMatch value)? pastMatch,
    TResult Function(NextMatch value)? nextMatch,
    required TResult orElse(),
  }) {
    if (nextMatch != null) {
      return nextMatch(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NextMatchImplToJson(
      this,
    );
  }
}

abstract class NextMatch implements Matches {
  factory NextMatch({required final Team home, required final Team visitor}) =
      _$NextMatchImpl;

  factory NextMatch.fromJson(Map<String, dynamic> json) =
      _$NextMatchImpl.fromJson;

  @override
  Team get home;
  @override
  Team get visitor;
  @override
  @JsonKey(ignore: true)
  _$$NextMatchImplCopyWith<_$NextMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
