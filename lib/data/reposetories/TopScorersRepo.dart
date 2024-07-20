import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sports_app/data/models/TopScorersData.dart';

class TopScorersRepo {
  Future<TopScorersData> fetchTopScorersData(int leagueId) async {
    final url =
        'https://apiv2.allsportsapi.com/football/?met=Topscorers&leagueId=$leagueId&APIkey=4dbd8cf7eeee81d13356a42a98b66173295d491fdeaa4434e4a93d64b13a447b';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return TopScorersData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load top scorers data');
    }
  }
}
