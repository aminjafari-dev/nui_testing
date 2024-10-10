import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nui_testing_app/services/strava/athlate/model/activity_stats.dart';
import 'package:nui_testing_app/services/strava/athlate/model/athlete.dart';
import 'package:nui_testing_app/services/strava/athlate/model/zones.dart';

class StravaService {
  final String baseUrl = "https://www.strava.com/api/v3";
  final String accessToken; // You should have the OAuth2 token from Strava API

  StravaService({required this.accessToken});

  Future<Athlete> getLoggedInAthlete() async {
    final response = await http.get(
      Uri.parse('$baseUrl/athlete'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return Athlete.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load athlete');
    }
  }

  Future<ActivityStats> getAthleteStats(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/athletes/$id/stats'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return ActivityStats.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load athlete stats');
    }
  }

  Future<List<Zones>> getLoggedInAthleteZones() async {
    final response = await http.get(
      Uri.parse('$baseUrl/athlete/zones'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((zone) => Zones.fromJson(zone))
          .toList();
    } else {
      throw Exception('Failed to load zones');
    }
  }

  Future<Athlete> updateLoggedInAthlete(double weight) async {
    final response = await http.put(
      Uri.parse('$baseUrl/athlete'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'weight': weight.toString(),
      },
    );

    if (response.statusCode == 200) {
      return Athlete.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update athlete');
    }
  }
}
