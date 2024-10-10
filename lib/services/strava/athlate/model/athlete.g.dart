// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Athlete _$AthleteFromJson(Map<String, dynamic> json) => Athlete(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      sex: json['sex'] as String,
      premium: json['premium'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$AthleteToJson(Athlete instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'sex': instance.sex,
      'premium': instance.premium,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
