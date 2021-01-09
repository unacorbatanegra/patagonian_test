class Search {
  final String artistName;
  final String songName;
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
