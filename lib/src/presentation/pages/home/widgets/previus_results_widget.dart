import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import 'search_widget.dart';

class PreviusResults extends StatelessWidget {
  final Search lastSearch;
  final VoidCallback onTap;
  const PreviusResults({
    Key key,
    @required this.lastSearch,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Previous searches...'),
        const Divider(),
        SearchWidget(
          search: lastSearch,
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
