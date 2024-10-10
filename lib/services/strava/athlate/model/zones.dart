import 'package:json_annotation/json_annotation.dart';

part 'zones.g.dart';

@JsonSerializable()
class DistributionBucket {
  final int max;
  final int min;
  final int time;

  DistributionBucket({
    required this.max,
    required this.min,
    required this.time,
  });

  factory DistributionBucket.fromJson(Map<String, dynamic> json) =>
      _$DistributionBucketFromJson(json);

  Map<String, dynamic> toJson() => _$DistributionBucketToJson(this);
}

@JsonSerializable()
class Zones {
  final String type;
  final bool sensorBased;
  final List<DistributionBucket> distributionBuckets;

  Zones({
    required this.type,
    required this.sensorBased,
    required this.distributionBuckets,
  });

  factory Zones.fromJson(Map<String, dynamic> json) =>
      _$ZonesFromJson(json);

  Map<String, dynamic> toJson() => _$ZonesToJson(this);
}
