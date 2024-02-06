// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameReport _$GameReportFromJson(Map<String, dynamic> json) {
  return _GameReport.fromJson(json);
}

/// @nodoc
mixin _$GameReport {
  Map<dynamic, dynamic> get report => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameReportCopyWith<GameReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameReportCopyWith<$Res> {
  factory $GameReportCopyWith(
          GameReport value, $Res Function(GameReport) then) =
      _$GameReportCopyWithImpl<$Res, GameReport>;
  @useResult
  $Res call({Map<dynamic, dynamic> report});
}

/// @nodoc
class _$GameReportCopyWithImpl<$Res, $Val extends GameReport>
    implements $GameReportCopyWith<$Res> {
  _$GameReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = null,
  }) {
    return _then(_value.copyWith(
      report: null == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameReportImplCopyWith<$Res>
    implements $GameReportCopyWith<$Res> {
  factory _$$GameReportImplCopyWith(
          _$GameReportImpl value, $Res Function(_$GameReportImpl) then) =
      __$$GameReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<dynamic, dynamic> report});
}

/// @nodoc
class __$$GameReportImplCopyWithImpl<$Res>
    extends _$GameReportCopyWithImpl<$Res, _$GameReportImpl>
    implements _$$GameReportImplCopyWith<$Res> {
  __$$GameReportImplCopyWithImpl(
      _$GameReportImpl _value, $Res Function(_$GameReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = null,
  }) {
    return _then(_$GameReportImpl(
      report: null == report
          ? _value._report
          : report // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameReportImpl with DiagnosticableTreeMixin implements _GameReport {
  const _$GameReportImpl({required final Map<dynamic, dynamic> report})
      : _report = report;

  factory _$GameReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameReportImplFromJson(json);

  final Map<dynamic, dynamic> _report;
  @override
  Map<dynamic, dynamic> get report {
    if (_report is EqualUnmodifiableMapView) return _report;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_report);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameReport(report: $report)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameReport'))
      ..add(DiagnosticsProperty('report', report));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameReportImpl &&
            const DeepCollectionEquality().equals(other._report, _report));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_report));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameReportImplCopyWith<_$GameReportImpl> get copyWith =>
      __$$GameReportImplCopyWithImpl<_$GameReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameReportImplToJson(
      this,
    );
  }
}

abstract class _GameReport implements GameReport {
  const factory _GameReport({required final Map<dynamic, dynamic> report}) =
      _$GameReportImpl;

  factory _GameReport.fromJson(Map<String, dynamic> json) =
      _$GameReportImpl.fromJson;

  @override
  Map<dynamic, dynamic> get report;
  @override
  @JsonKey(ignore: true)
  _$$GameReportImplCopyWith<_$GameReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
