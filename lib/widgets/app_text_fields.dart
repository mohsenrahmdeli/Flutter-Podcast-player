// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppTextFields extends StatelessWidget {
  final TextEditingController controller;
  final bool isAutoFocus;
  final String? labelText;
  final String? hintText;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const AppTextFields({
    super.key,
    required this.controller,
    this.isAutoFocus = false,
    this.labelText,
    this.hintText,
    this.textInputType,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: isAutoFocus,
      controller: controller,
      keyboardType: textInputType,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade300,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black12),
        filled: true,
      ),
    );
  }
}
