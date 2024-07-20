import 'package:dio/dio.dart';
import 'package:sports_app/data/models/TeamsData.dart';

class TeamsRepo {
  final Dio dio = Dio();

  Future<TeamsData> fetchTeamsData(int leagueId) async {
    try {
      final response = await dio.get(
        'https://apiv2.allsportsapi.com/football/?met=Teams&leagueId=$leagueId&APIkey=4dbd8cf7eeee81d13356a42a98b66173295d491fdeaa4434e4a93d64b13a447b'
      );
      if (response.statusCode == 200) {
        return TeamsData.fromJson(response.data);
      } else {
        throw Exception('Failed to load teams data');
      }
    } catch (e) {
      throw Exception('Failed to load teams data: $e');
    }
  }
}
