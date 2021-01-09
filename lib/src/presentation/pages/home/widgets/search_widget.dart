import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import '../../../widgets/widgets.dart';

class SearchWidget extends StatelessWidget {
  final Search search;
  final VoidCallback onTap;
  const SearchWidget({
    Key key,
    @required this.search,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(search.hashCode);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(search.artistName),
      subtitle: Text(search.songName),
      trailing: RaisedButton(
        color: Palette.primary,
        child: const Text(
          'View lyrics',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
