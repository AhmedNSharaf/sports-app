class PlayersData {
  PlayersData({
    required this.success,
    required this.result,
  });
  late final int success;
  late final List<Result> result;

  PlayersData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = List.from(json['result']).map((e) => Result.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['result'] = result.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Result {
  Result({
    required this.playerKey,
    required this.playerName,
    this.playerNumber,
    this.playerCountry,
    required this.playerType,
    this.playerAge,
    this.playerMatchPlayed,
    this.playerGoals,
    this.playerYellowCards,
    this.playerRedCards,
    this.playerMinutes,
    required this.playerInjured,
    this.playerSubstituteOut,
    this.playerSubstitutesOnBench,
    this.playerAssists,
    required this.playerIsCaptain,
    this.playerShotsTotal,
    this.playerGoalsConceded,
    this.playerFoulsCommited,
    this.playerTackles,
    this.playerBlocks,
    this.playerCrossesTotal,
    this.playerInterceptions,
    this.playerClearances,
    this.playerDispossesed,
    this.playerSaves,
    this.playerInsideBoxSaves,
    this.playerDuelsTotal,
    this.playerDuelsWon,
    this.playerDribbleAttempts,
    this.playerDribbleSucc,
    this.playerPenComm,
    this.playerPenWon,
    this.playerPenScored,
    this.playerPenMissed,
    this.playerPasses,
    this.playerPassesAccuracy,
    this.playerKeyPasses,
    this.playerWoordworks,
    this.playerRating,
    required this.teamName,
    required this.teamKey,
    this.playerImage,
  });
  late final int playerKey;
  late final String playerName;
  late final String? playerNumber;
  late final String? playerCountry;
  late final String playerType;
  late final String? playerAge;
  late final String? playerMatchPlayed;
  late final String? playerGoals;
  late final String? playerYellowCards;
  late final String? playerRedCards;
  late final String? playerMinutes;
  late final String playerInjured;
  late final String? playerSubstituteOut;
  late final String? playerSubstitutesOnBench;
  late final String? playerAssists;
  late final String playerIsCaptain;
  late final String? playerShotsTotal;
  late final String? playerGoalsConceded;
  late final String? playerFoulsCommited;
  late final String? playerTackles;
  late final String? playerBlocks;
  late final String? playerCrossesTotal;
  late final String? playerInterceptions;
  late final String? playerClearances;
  late final String? playerDispossesed;
  late final String? playerSaves;
  late final String? playerInsideBoxSaves;
  late final String? playerDuelsTotal;
  late final String? playerDuelsWon;
  late final String? playerDribbleAttempts;
  late final String? playerDribbleSucc;
  late final String? playerPenComm;
  late final String? playerPenWon;
  late final String? playerPenScored;
  late final String? playerPenMissed;
  late final String? playerPasses;
  late final String? playerPassesAccuracy;
  late final String? playerKeyPasses;
  late final String? playerWoordworks;
  late final String? playerRating;
  late final String teamName;
  late final int teamKey;
  late final String? playerImage;

  Result.fromJson(Map<String, dynamic> json) {
    playerKey = json['player_key'];
    playerName = json['player_name'];
    playerNumber = json['player_number'];
    playerCountry = json['player_country'];
    playerType = json['player_type'];
    playerAge = json['player_age'];
    playerMatchPlayed = json['player_match_played'];
    playerGoals = json['player_goals'];
    playerYellowCards = json['player_yellow_cards'];
    playerRedCards = json['player_red_cards'];
    playerMinutes = json['player_minutes'];
    playerInjured = json['player_injured'];
    playerSubstituteOut = json['player_substitute_out'];
    playerSubstitutesOnBench = json['player_substitutes_on_bench'];
    playerAssists = json['player_assists'];
    playerIsCaptain = json['player_is_captain'];
    playerShotsTotal = json['player_shots_total'];
    playerGoalsConceded = null;
    playerFoulsCommited = null;
    playerTackles = null;
    playerBlocks = null;
    playerCrossesTotal = null;
    playerInterceptions = null;
    playerClearances = null;
    playerDispossesed = null;
    playerSaves = null;
    playerInsideBoxSaves = null;
    playerDuelsTotal = null;
    playerDuelsWon = null;
    playerDribbleAttempts = null;
    playerDribbleSucc = null;
    playerPenComm = null;
    playerPenWon = null;
    playerPenScored = null;
    playerPenMissed = null;
    playerPasses = null;
    playerPassesAccuracy = null;
    playerKeyPasses = null;
    playerWoordworks = null;
    playerRating = null;
    teamName = json['team_name'];
    teamKey = json['team_key'];
    playerImage = json['player_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['player_key'] = playerKey;
    _data['player_name'] = playerName;
    _data['player_number'] = playerNumber;
    _data['player_country'] = playerCountry;
    _data['player_type'] = playerType;
    _data['player_age'] = playerAge;
    _data['player_match_played'] = playerMatchPlayed;
    _data['player_goals'] = playerGoals;
    _data['player_yellow_cards'] = playerYellowCards;
    _data['player_red_cards'] = playerRedCards;
    _data['player_minutes'] = playerMinutes;
    _data['player_injured'] = playerInjured;
    _data['player_substitute_out'] = playerSubstituteOut;
    _data['player_substitutes_on_bench'] = playerSubstitutesOnBench;
    _data['player_assists'] = playerAssists;
    _data['player_is_captain'] = playerIsCaptain;
    _data['player_shots_total'] = playerShotsTotal;
    _data['player_goals_conceded'] = playerGoalsConceded;
    _data['player_fouls_commited'] = playerFoulsCommited;
    _data['player_tackles'] = playerTackles;
    _data['player_blocks'] = playerBlocks;
    _data['player_crosses_total'] = playerCrossesTotal;
    _data['player_interceptions'] = playerInterceptions;
    _data['player_clearances'] = playerClearances;
    _data['player_dispossesed'] = playerDispossesed;
    _data['player_saves'] = playerSaves;
    _data['player_inside_box_saves'] = playerInsideBoxSaves;
    _data['player_duels_total'] = playerDuelsTotal;
    _data['player_duels_won'] = playerDuelsWon;
    _data['player_dribble_attempts'] = playerDribbleAttempts;
    _data['player_dribble_succ'] = playerDribbleSucc;
    _data['player_pen_comm'] = playerPenComm;
    _data['player_pen_won'] = playerPenWon;
    _data['player_pen_scored'] = playerPenScored;
    _data['player_pen_missed'] = playerPenMissed;
    _data['player_passes'] = playerPasses;
    _data['player_passes_accuracy'] = playerPassesAccuracy;
    _data['player_key_passes'] = playerKeyPasses;
    _data['player_woordworks'] = playerWoordworks;
    _data['player_rating'] = playerRating;
    _data['team_name'] = teamName;
    _data['team_key'] = teamKey;
    _data['player_image'] = playerImage;
    return _data;
  }
}
