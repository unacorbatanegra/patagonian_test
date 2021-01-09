import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../widgets/widgets.dart';

class SearchInput extends StatelessWidget {
  final IconData icon;
  final TextEditingController controller;
  final String hint;
  const SearchInput({
    Key key,
    @required this.icon,
    @required this.controller,
    @required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 6.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Palette.accent,
          ),
          Expanded(
            child: CustomTextField(
              controller: controller,
              hint: hint,
            ),
          )
        ],
      ),
    );
  }
}
