import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'game_report.freezed.dart';
part 'game_report.g.dart';

@freezed
class GameReport with _$GameReport {
  const factory GameReport({required Map report}) = _GameReport;

  factory GameReport.fromJson(Map<String, dynamic> json) => _$GameReportFromJson(json);
}
