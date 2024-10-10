import 'package:json_annotation/json_annotation.dart';

part 'activity_stats.g.dart';

@JsonSerializable()
class ActivityStats {
  final int runTotals;
  final int rideTotals;
  final int swimTotals;

  ActivityStats({
    required this.runTotals,
    required this.rideTotals,
    required this.swimTotals,
  });

  factory ActivityStats.fromJson(Map<String, dynamic> json) =>
      _$ActivityStatsFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityStatsToJson(this);
}
