// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SeasonState _$SeasonStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
mixin _$SeasonState {
  Season? get currentSeason => throw _privateConstructorUsedError;
  List<Season>? get season => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeasonStateCopyWith<SeasonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonStateCopyWith<$Res> {
  factory $SeasonStateCopyWith(
          SeasonState value, $Res Function(SeasonState) then) =
      _$SeasonStateCopyWithImpl<$Res, SeasonState>;
  @useResult
  $Res call({Season? currentSeason, List<Season>? season});

  $SeasonCopyWith<$Res>? get currentSeason;
}

/// @nodoc
class _$SeasonStateCopyWithImpl<$Res, $Val extends SeasonState>
    implements $SeasonStateCopyWith<$Res> {
  _$SeasonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSeason = freezed,
    Object? season = freezed,
  }) {
    return _then(_value.copyWith(
      currentSeason: freezed == currentSeason
          ? _value.currentSeason
          : currentSeason // ignore: cast_nullable_to_non_nullable
              as Season?,
      season: freezed == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as List<Season>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SeasonCopyWith<$Res>? get currentSeason {
    if (_value.currentSeason == null) {
      return null;
    }

    return $SeasonCopyWith<$Res>(_value.currentSeason!, (value) {
      return _then(_value.copyWith(currentSeason: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $SeasonStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Season? currentSeason, List<Season>? season});

  @override
  $SeasonCopyWith<$Res>? get currentSeason;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$SeasonStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSeason = freezed,
    Object? season = freezed,
  }) {
    return _then(_$AppStateImpl(
      currentSeason: freezed == currentSeason
          ? _value.currentSeason
          : currentSeason // ignore: cast_nullable_to_non_nullable
              as Season?,
      season: freezed == season
          ? _value._season
          : season // ignore: cast_nullable_to_non_nullable
              as List<Season>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppStateImpl with DiagnosticableTreeMixin implements _AppState {
  const _$AppStateImpl({this.currentSeason, final List<Season>? season})
      : _season = season;

  factory _$AppStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppStateImplFromJson(json);

  @override
  final Season? currentSeason;
  final List<Season>? _season;
  @override
  List<Season>? get season {
    final value = _season;
    if (value == null) return null;
    if (_season is EqualUnmodifiableListView) return _season;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeasonState(currentSeason: $currentSeason, season: $season)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SeasonState'))
      ..add(DiagnosticsProperty('currentSeason', currentSeason))
      ..add(DiagnosticsProperty('season', season));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.currentSeason, currentSeason) ||
                other.currentSeason == currentSeason) &&
            const DeepCollectionEquality().equals(other._season, _season));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentSeason, const DeepCollectionEquality().hash(_season));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppStateImplToJson(
      this,
    );
  }
}

abstract class _AppState implements SeasonState {
  const factory _AppState(
      {final Season? currentSeason,
      final List<Season>? season}) = _$AppStateImpl;

  factory _AppState.fromJson(Map<String, dynamic> json) =
      _$AppStateImpl.fromJson;

  @override
  Season? get currentSeason;
  @override
  List<Season>? get season;
  @override
  @JsonKey(ignore: true)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
