
class PlayersStatsAndInfo {

  String id;
  String playerName;
  String goalsScored;
  String assists;
  String yellowCard;
  String redCard;
  String preferredFoot;
  String playerPosition;
  String matchesPlayed;
  String playerValue;
  String playerOfTheMonth;
  String age;
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
    playerOfTheMonth = data['player_of_the_month'];
    age = data['age'];
    nationality = data['nationality'];
    image = data['image'];
  }

}