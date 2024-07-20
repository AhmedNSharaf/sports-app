import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sports_app/data/models/PlayersData.dart';

class PlayersRepo {
  Future<PlayersData> fetchPlayersData(int teamId) async {
    //final response = await http.get(Uri.parse('https://apiv2.allsportsapi.com/football/?met=Players&teamId=$teamId&APIkey=4dbd8cf7eeee81d13356a42a98b66173295d491fdeaa4434e4a93d64b13a447b'));
    final response = await http.get(Uri.parse('https://apiv2.allsportsapi.com/football/?&met=Players&teamId=$teamId&APIkey=4dbd8cf7eeee81d13356a42a98b66173295d491fdeaa4434e4a93d64b13a447b'));

    if (response.statusCode == 200) {
      return PlayersData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load players data');
    }
  }
}
