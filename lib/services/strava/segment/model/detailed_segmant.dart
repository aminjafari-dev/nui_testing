class DetailedSegment {
  int id;
  int resourceState;
  String name;
  String activityType;
  double distance;
  double averageGrade;
  double maximumGrade;
  double elevationHigh;
  double elevationLow;
  List<double> startLatlng;
  List<double> endLatlng;
  int climbCategory;
  String city;
  String state;
  String country;
  bool isPrivate;
  bool hazardous;
  bool starred;
  double totalElevationGain;
  Map<String, dynamic> map;
  int effortCount;
  int athleteCount;
  int starCount;
  AthleteSegmentStats athleteSegmentStats;

  DetailedSegment({
    required this.id,
    required this.resourceState,
    required this.name,
    required this.activityType,
    required this.distance,
    required this.averageGrade,
    required this.maximumGrade,
    required this.elevationHigh,
    required this.elevationLow,
    required this.startLatlng,
    required this.endLatlng,
    required this.climbCategory,
    required this.city,
    required this.state,
    required this.country,
    required this.isPrivate,
    required this.hazardous,
    required this.starred,
    required this.totalElevationGain,
    required this.map,
    required this.effortCount,
    required this.athleteCount,
    required this.starCount,
    required this.athleteSegmentStats,
  });

  factory DetailedSegment.fromJson(Map<String, dynamic> json) {
    return DetailedSegment(
      id: json['id'],
      resourceState: json['resource_state'],
      name: json['name'],
      activityType: json['activity_type'],
      distance: json['distance'],
      averageGrade: json['average_grade'],
      maximumGrade: json['maximum_grade'],
      elevationHigh: json['elevation_high'],
      elevationLow: json['elevation_low'],
      startLatlng: List<double>.from(json['start_latlng']),
      endLatlng: List<double>.from(json['end_latlng']),
      climbCategory: json['climb_category'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      isPrivate: json['private'],
      hazardous: json['hazardous'],
      starred: json['starred'],
      totalElevationGain: json['total_elevation_gain'],
      map: json['map'],
      effortCount: json['effort_count'],
      athleteCount: json['athlete_count'],
      starCount: json['star_count'],
      athleteSegmentStats: AthleteSegmentStats.fromJson(json['athlete_segment_stats']),
    );
  }
}

class AthleteSegmentStats {
  int prElapsedTime;
  String prDate;
  int effortCount;

  AthleteSegmentStats({
    required this.prElapsedTime,
    required this.prDate,
    required this.effortCount,
  });

  factory AthleteSegmentStats.fromJson(Map<String, dynamic> json) {
    return AthleteSegmentStats(
      prElapsedTime: json['pr_elapsed_time'],
      prDate: json['pr_date'],
      effortCount: json['effort_count'],
    );
  }
}
