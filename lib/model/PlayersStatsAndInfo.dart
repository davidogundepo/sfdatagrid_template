
class PlayersStatsAndInfo {

  String id;
  String name;
  String goalsScored;
  String assists;
  String yellowCard;
  String redCard;
  String preferredFoot;
  String position;
  String matchesPlayed;
  String playerValue;
  String age;
  String nationality;
  String image;

  PlayersStatsAndInfo.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    goalsScored = data['goals_scored'];
    assists = data['assists'];
    yellowCard = data['yellow_card'];
    redCard = data['red_card'];
    preferredFoot = data['preferred_foot'];
    position = data['position'];
    matchesPlayed = data['matches_played'];
    playerValue = data['player_value'];
    age = data['age'];
    nationality = data['nationality'];
    image = data['image'];
  }

}