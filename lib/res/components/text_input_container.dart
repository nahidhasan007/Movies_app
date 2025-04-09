import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Function(String)? onFiledValue;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({super.key,
      required this.controller,
      this.hintText,
      this.labelText,
      this.prefixIcon,
      this.keyboardType,
      this.focusNode,
      this.onFiledValue,
      required this.obscureText,
      this.validator});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 48,
       child:  TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
      )
      ),
      onFieldSubmitted: onFiledValue,
      validator: validator,
    )
    );
  }
}
