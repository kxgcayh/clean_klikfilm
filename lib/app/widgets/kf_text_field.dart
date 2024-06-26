import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:recase/recase.dart';

class KfTextField extends StatelessWidget {
  final String label;
  final bool showLabel;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final bool obscureText;
  final GlobalKey<FormBuilderState>? formKey;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool alignCenter;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const KfTextField({
    super.key,
    required this.label,
    this.showLabel = true,
    this.hintText,
    this.hintStyle,
    this.validator,
    this.obscureText = false,
    this.formKey,
    this.prefixIcon,
    this.suffixIcon,
    this.alignCenter = false,
    this.keyboardType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel)
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 8),
            child: Text(
              label,
              style: TextStyle(fontSize: 16, color: KColors.silverSand),
            ),
          ),
        FormBuilderTextField(
          key: formKey,
          name: label.camelCase,
          controller: controller,
          keyboardType: keyboardType,
          textAlign: alignCenter ? TextAlign.center : TextAlign.start,
          textAlignVertical: alignCenter ? TextAlignVertical.center : TextAlignVertical.top,
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          cursorColor: KColors.primaryGrey,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            contentPadding: EdgeInsets.fromLTRB(16, prefixIcon != null ? 12 : 14, 16, 14),
            hintStyle: hintStyle ?? TextStyle(fontSize: 16, color: KColors.silverSand),
            alignLabelWithHint: true,
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white, width: 0.5),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
