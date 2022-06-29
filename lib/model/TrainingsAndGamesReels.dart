import 'package:cloud_firestore/cloud_firestore.dart';

class TrainingsAndGamesReels {

  String? id;
  String? image;
  DocumentReference? reference;

  TrainingsAndGamesReels.fromMap(Map<String, dynamic> data, {this.reference}) {
    id = data['id'];
    image = data['image'];
  }

}