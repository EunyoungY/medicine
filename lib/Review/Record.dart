import 'package:cloud_firestore/cloud_firestore.dart';


class Record {
  final DocumentReference reference;

  final String name;
  final String effectText;
  final String sideEffectText;
  final String overallText;
  final String id;
  final bool favoriteSelected;
  var noFavorite;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['effectText'] != null),
        assert(map['sideEffectText'] != null),
        assert(map['overallText'] != null),
        assert(map['id'] != null),
        assert(map['favoriteSelected'] != null),
        assert(map['noFavorite'] != null),

        name = map['name'],
        effectText = map['effectText'],
        sideEffectText = map['sideEffectText'],
        overallText = map['overallText'],
        id = map['id'],
        favoriteSelected = map['favoriteSelected'],
        noFavorite = map['noFavorite'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

}