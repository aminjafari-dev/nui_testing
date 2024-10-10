class SummarySegment {
  int id;
  int resourceState;
  String name;
  String activityType;
  double distance;
  double averageGrade;
  double elevationHigh;
  double elevationLow;
  List<double> startLatlng;
  List<double> endLatlng;

  SummarySegment({
    required this.id,
    required this.resourceState,
    required this.name,
    required this.activityType,
    required this.distance,
    required this.averageGrade,
    required this.elevationHigh,
    required this.elevationLow,
    required this.startLatlng,
    required this.endLatlng,
  });

  factory SummarySegment.fromJson(Map<String, dynamic> json) {
    return SummarySegment(
      id: json['id'],
      resourceState: json['resource_state'],
      name: json['name'],
      activityType: json['activity_type'],
      distance: json['distance'],
      averageGrade: json['average_grade'],
      elevationHigh: json['elevation_high'],
      elevationLow: json['elevation_low'],
      startLatlng: List<double>.from(json['start_latlng']),
      endLatlng: List<double>.from(json['end_latlng']),
    );
  }
}
