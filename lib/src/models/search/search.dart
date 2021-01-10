import 'package:hive/hive.dart';
part 'search.g.dart';

@HiveType(typeId: 0)
class Search {
  @HiveField(0)
  final String artistName;
  @HiveField(1)
  final String songName;
  @HiveField(2)
  final String lyrics;
  Search({
    this.artistName,
    this.songName,
    this.lyrics,
  });

  Map<String, dynamic> toJson() => {
        'artistName': artistName,
        'songName': songName,
      };

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        lyrics: json['lyrics'] as String ?? '',
      );
  Search update(Search other) => Search(
        lyrics: lyrics,
        artistName: other.artistName,
        songName: other.songName,
      );
}
