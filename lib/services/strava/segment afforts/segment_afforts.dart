import 'dart:convert';
import 'package:http/http.dart' as http;

class StravaSegmentEffortService {
  final String baseUrl = 'https://www.strava.com/api/v3';
  final String token; // Bearer token for authentication

  StravaSegmentEffortService(this.token);

  Map<String, String> get headers => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

  // Get segment efforts for a specific segment (with optional date range)
  Future<List<dynamic>> getEffortsBySegmentId(int segmentId,
      {String? startDateLocal, String? endDateLocal, int perPage = 30}) async {
    var url = '$baseUrl/segment_efforts?segment_id=$segmentId&per_page=$perPage';

    if (startDateLocal != null) {
      url += '&start_date_local=$startDateLocal';
    }

    if (endDateLocal != null) {
      url += '&end_date_local=$endDateLocal';
    }

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load segment efforts');
    }
  }

  // Get a specific segment effort by ID
  Future<Map<String, dynamic>> getSegmentEffortById(int effortId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/segment_efforts/$effortId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load segment effort');
    }
  }

  // Explore segments within a specified boundary
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

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body)['segments'];
    } else {
      throw Exception('Failed to explore segments');
    }
  }
}
