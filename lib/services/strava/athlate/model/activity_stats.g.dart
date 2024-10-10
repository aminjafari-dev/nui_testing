// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityStats _$ActivityStatsFromJson(Map<String, dynamic> json) =>
    ActivityStats(
      runTotals: (json['runTotals'] as num).toInt(),
      rideTotals: (json['rideTotals'] as num).toInt(),
      swimTotals: (json['swimTotals'] as num).toInt(),
    );

Map<String, dynamic> _$ActivityStatsToJson(ActivityStats instance) =>
    <String, dynamic>{
      'runTotals': instance.runTotals,
      'rideTotals': instance.rideTotals,
      'swimTotals': instance.swimTotals,
    };
