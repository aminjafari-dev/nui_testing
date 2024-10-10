import 'dart:convert';
import 'package:http/http.dart' as http;

class StravaService {
  final String baseUrl; // Base URL for the API
  final String accessToken; // Bearer token for authentication

  StravaService({required this.baseUrl, required this.accessToken});

  // Get activities of a specific club by its ID
  Future<List<dynamic>> getClubActivitiesById(int clubId, {int? page, int? perPage}) async {
    // Construct the URI with the club ID and optional pagination parameters
    final queryParams = {
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
    };

    final uri = Uri.parse('$baseUrl/clubs/$clubId/activities').replace(queryParameters: queryParams.map((key, value) => MapEntry(key, value.toString())));

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the list of club activities
    } else {
      throw Exception('Failed to fetch club activities: ${response.body}');
    }
  }

  // Get clubs of the authenticated athlete
  Future<List<dynamic>> getLoggedInAthleteClubs({int? page, int? perPage}) async {
    final queryParams = {
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
    };

    final uri = Uri.parse('$baseUrl/athlete/clubs').replace(queryParameters: queryParams.map((key, value) => MapEntry(key, value.toString())));

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the list of athlete clubs
    } else {
      throw Exception('Failed to fetch athlete clubs: ${response.body}');
    }
  }

  // Get gear by ID
  Future<Map<String, dynamic>> getGearById(String gearId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/gear/$gearId'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the gear details
    } else {
      throw Exception('Failed to fetch gear: ${response.body}');
    }
  }
}
