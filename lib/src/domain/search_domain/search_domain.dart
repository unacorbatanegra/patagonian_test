import '../domain.dart';

class SearchDomain extends Domain<Search> {
  final _boxName = 'searches';
  Future<ApiResponse<Search>> fetch(Search search) async {
    final result = await httpRepository.fetchData(
      'https://api.lyrics.ovh/v1/${search.artistName}/${search.songName}',
      (_) => Search.fromJson(_),
    );
    if (result.data.lyrics.isNotEmpty && !result.hasError) {
      result.data = result.data.update(search);
      hiveRepository.add(_boxName, result.data);
    }
    return result;
  }

  List<Search> get lastResults => hiveRepository.getList(_boxName);
}
