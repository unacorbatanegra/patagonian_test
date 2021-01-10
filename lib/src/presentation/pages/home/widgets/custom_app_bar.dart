import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import 'search_input.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final TextEditingController artistName;
  final TextEditingController songName;
  final VoidCallback search;
  final VoidCallback onHistory;
  final bool canSearch;
  const CustomAppBar({
    Key key,
    @required this.artistName,
    @required this.songName,
    @required this.search,
    @required this.canSearch,
    @required this.onHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Patagonian Test'),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.history,
            color: Palette.accent,
          ),
          onPressed: onHistory,
        )
      ],
      leading: CachedNetworkImage(
        imageUrl: 'https://patagonian.it/assets/img/favicon.png',
      ),
      bottom: PreferredSize(
        preferredSize: null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchInput(
              icon: Icons.person,
              controller: artistName,
              hint: 'Artist name...',
            ),
            SearchInput(
              icon: Icons.music_note,
              controller: songName,
              hint: 'Song name...',
            ),
            RaisedButton(
              onPressed: search,
              color: canSearch ? Palette.accent : Colors.grey,
              child: Text(
                'Search',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(200.0);
}
