import 'dart:convert';
import 'package:http/http.dart' as http;

class ActivityService {
  final String baseUrl = 'https://www.strava.com/api/v3';  // Strava API base URL
  final String accessToken;  // Authentication token

  ActivityService(this.accessToken);

  // General GET request handler
  Future<dynamic> _getRequest(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  // 1. Get Activity Laps
  Future<List<dynamic>> getLapsByActivityId(int activityId) async {
    final endpoint = '/activities/$activityId/laps';
    final response = await _getRequest(endpoint);
    return response;
  }

  // 2. Get Activity Zones
  Future<List<dynamic>> getZonesByActivityId(int activityId) async {
    final endpoint = '/activities/$activityId/zones';
    final response = await _getRequest(endpoint);
    return response;
  }

  // 3. Get Activity Comments
  Future<List<dynamic>> getCommentsByActivityId(int activityId, {int? pageSize = 30, String? afterCursor}) async {
    final endpoint = '/activities/$activityId/comments?page_size=$pageSize${afterCursor != null ? '&after_cursor=$afterCursor' : ''}';
    final response = await _getRequest(endpoint);
    return response;
  }

  // 4. Get Activity Kudos (Kudoers)
  Future<List<dynamic>> getKudoersByActivityId(int activityId, {int? pageSize = 30, String? afterCursor}) async {
    final endpoint = '/activities/$activityId/kudos?page_size=$pageSize${afterCursor != null ? '&after_cursor=$afterCursor' : ''}';
    final response = await _getRequest(endpoint);
    return response;
  }
}


class ActivityServicea {
  final String baseUrl; // Base URL for the API
  final String accessToken; // Bearer token for authentication

  ActivityServicea({required this.baseUrl, required this.accessToken});

  // Create an activity
  Future<Map<String, dynamic>> createActivity(Map<String, dynamic> activityData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/activities'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: activityData,
    );

    if (response.statusCode == 201) {
      return json.decode(response.body); // Return the created activity
    } else {
      throw Exception('Failed to create activity: ${response.body}');
    }
  }

  // Get activity by ID
  Future<Map<String, dynamic>> getActivityById(int id, {bool includeAllEfforts = false}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/activities/$id?include_all_efforts=$includeAllEfforts'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the activity details
    } else {
      throw Exception('Failed to fetch activity: ${response.body}');
    }
  }

  // Update activity by ID
  Future<Map<String, dynamic>> updateActivityById(int id, Map<String, dynamic> updatedData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/activities/$id'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(updatedData),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the updated activity
    } else {
      throw Exception('Failed to update activity: ${response.body}');
    }
  }
}



class ActivityServicee {
  final String baseUrl; // Base URL for the API
  final String accessToken; // Bearer token for authentication

  ActivityServicee({required this.baseUrl, required this.accessToken});

  // Create an activity
  Future<Map<String, dynamic>> createActivity(Map<String, dynamic> activityData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/activities'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: activityData,
    );

    if (response.statusCode == 201) {
      return json.decode(response.body); // Return the created activity
    } else {
      throw Exception('Failed to create activity: ${response.body}');
    }
  }

  // Get logged-in athlete's activities
  Future<List<dynamic>> getLoggedInAthleteActivities({
    int? before,
    int? after,
    int? page = 1,
    int? perPage = 30,
  }) async {
    // Construct the query parameters
    final Map<String, dynamic> queryParams = {
      if (before != null) 'before': before,
      if (after != null) 'after': after,
      'page': page,
      'per_page': perPage,
    };

    final uri = Uri.parse('$baseUrl/athlete/activities').replace(queryParameters: queryParams.map((key, value) => MapEntry(key, value.toString())));

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the list of activities
    } else {
      throw Exception('Failed to fetch activities: ${response.body}');
    }
  }

  // Get activity by ID
  Future<Map<String, dynamic>> getActivityById(int id, {bool includeAllEfforts = false}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/activities/$id?include_all_efforts=$includeAllEfforts'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the activity details
    } else {
      throw Exception('Failed to fetch activity: ${response.body}');
    }
  }

  // Update activity by ID
  Future<Map<String, dynamic>> updateActivityById(int id, Map<String, dynamic> updatedData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/activities/$id'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(updatedData),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the updated activity
    } else {
      throw Exception('Failed to update activity: ${response.body}');
    }
  }
}
