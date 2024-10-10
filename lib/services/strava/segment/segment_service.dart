import 'dart:convert';
import 'package:http/http.dart' as http;


class StravaSegmentService {
  final String baseUrl = 'https://www.strava.com/api/v3';
  final String token; // Bearer token for authentication
  
  StravaSegmentService(this.token);

  Map<String, String> get headers => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

  // Get a segment by ID
  Future<Map<String, dynamic>> getSegmentById(int segmentId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/segments/$segmentId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load segment');
    }
  }

  // Get the authenticated athlete's starred segments
  Future<List<dynamic>> getLoggedInAthleteStarredSegments({
    int page = 1,
    int perPage = 30,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl/segments/starred?page=$page&per_page=$perPage'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load starred segments');
    }
  }

  // Star or unstar a segment for the authenticated athlete
  Future<Map<String, dynamic>> starSegment(int segmentId, bool starred) async {
    final response = await http.put(
      Uri.parse('$baseUrl/segments/$segmentId/starred'),
      headers: headers,
      body: json.encode({'starred': starred}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to star/unstar segment');
    }
  }

  // Get the authenticated athlete's efforts on a specific segment
  Future<List<dynamic>> getEffortsBySegmentId(int segmentId,
      {String? startDateLocal, String? endDateLocal, int perPage = 30}) async {
    var url = '$baseUrl/segment_efforts?segment_id=$segmentId&per_page=$perPage';
    
    if (startDateLocal != null) {
      url += '&start_date_local=$startDateLocal';
    }

    if (endDateLocal != null) {
      url += '&end_date_local=$endDateLocal';
    }

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load segment efforts');
    }
  }

  // Explore segments in a specific area
  Future<List<dynamic>> exploreSegments(List<double> bounds,
      {String activityType = 'riding', int? minCat, int? maxCat}) async {
    var url =
        '$baseUrl/segments/explore?bounds=${bounds.join(',')}&activity_type=$activityType';
    
    if (minCat != null) {
      url += '&min_cat=$minCat';
    }

    if (maxCat != null) {
      url += '&max_cat=$maxCat';
    }

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['segments'];
    } else {
      throw Exception('Failed to explore segments');
    }
  }
}
