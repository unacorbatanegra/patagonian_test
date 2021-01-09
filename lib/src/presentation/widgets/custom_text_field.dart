import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.controller,
    @required this.hint,
    this.validator,
    this.autoValidate = false,
    this.readOnly = false,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.onTap,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;

  final bool autoValidate;
  final bool readOnly;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String Function(String) validator;
  final void Function(String) onChanged;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      validator: validator,
      autocorrect: autoValidate,
      textAlign: TextAlign.left,
      autovalidateMode: AutovalidateMode.always,
      readOnly: readOnly,
      onChanged: onChanged,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: 'Lato',
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(18.0),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
