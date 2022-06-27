
class PlayersStatsAndInfo {

  String id;
  String playerName;
  dynamic goalsScored;
  dynamic assists;
  dynamic yellowCard;
  dynamic redCard;
  String preferredFoot;
  String playerPosition;
  dynamic matchesPlayed;
  dynamic playerValue;
  dynamic cleanSheet;
  dynamic goalsConceded;
  String playerOfTheMonth;
  dynamic age;
  String nationality;
  String image;

  PlayersStatsAndInfo.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    playerName = data['player_name'];
    goalsScored = data['goals_scored'];
    assists = data['assists'];
    yellowCard = data['yellow_card'];
    redCard = data['red_card'];
    preferredFoot = data['preferred_foot'];
    playerPosition = data['player_position'];
    matchesPlayed = data['matches_played'];
    playerValue = data['player_value'];
    playerValue = data['clean_sheets'];
    playerValue = data['goals_conceded'];
    playerOfTheMonth = data['player_of_the_month'];
    age = data['age'];
    nationality = data['nationality'];
    image = data['image'];
  }

}