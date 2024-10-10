import 'package:json_annotation/json_annotation.dart';

part 'athlete.g.dart';

@JsonSerializable()
class Athlete {
  final int id;
  final String username;
  final String firstname;
  final String lastname;
  final String city;
  final String state;
  final String country;
  final String sex;
  final bool premium;
  final String createdAt;
  final String updatedAt;

  Athlete({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.city,
    required this.state,
    required this.country,
    required this.sex,
    required this.premium,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Athlete.fromJson(Map<String, dynamic> json) =>
      _$AthleteFromJson(json);

  Map<String, dynamic> toJson() => _$AthleteToJson(this);
}
