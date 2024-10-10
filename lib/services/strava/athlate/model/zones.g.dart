// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributionBucket _$DistributionBucketFromJson(Map<String, dynamic> json) =>
    DistributionBucket(
      max: (json['max'] as num).toInt(),
      min: (json['min'] as num).toInt(),
      time: (json['time'] as num).toInt(),
    );

Map<String, dynamic> _$DistributionBucketToJson(DistributionBucket instance) =>
    <String, dynamic>{
      'max': instance.max,
      'min': instance.min,
      'time': instance.time,
    };

Zones _$ZonesFromJson(Map<String, dynamic> json) => Zones(
      type: json['type'] as String,
      sensorBased: json['sensorBased'] as bool,
      distributionBuckets: (json['distributionBuckets'] as List<dynamic>)
          .map((e) => DistributionBucket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ZonesToJson(Zones instance) => <String, dynamic>{
      'type': instance.type,
      'sensorBased': instance.sensorBased,
      'distributionBuckets': instance.distributionBuckets,
    };
