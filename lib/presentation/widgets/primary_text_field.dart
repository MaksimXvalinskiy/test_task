import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/utils/app_styles.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType textInputType;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final GestureTapCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final int maxLine;
  final focusNode;
  final int maxLength;
  PrimaryTextField({
    Key? key,
    this.controller,
    required this.validator,
    required this.textInputType,
    required this.hintText,
    this.inputFormatters,
    this.onTap,
    this.inputTextStyle,
    this.hintTextStyle,
    this.readOnly = false,
    this.onChanged,
    this.maxLine = 1,
    this.focusNode,
    this.maxLength = 35
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      focusNode: focusNode,
      textAlign: TextAlign.left,
      onChanged: onChanged,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      onTap: onTap,
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      maxLines: maxLine,
      style: inputTextStyle ?? AppStyles.ordinary14w500.copyWith(color: Color.fromRGBO(240, 240, 240, 1)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintTextStyle ?? AppStyles.ordinary14w400.copyWith(color: Color.fromRGBO(96, 96, 105, 1)),
        enabledBorder: OutlineInputBorder (
            borderSide: BorderSide(color: Color.fromRGBO(141, 141, 148, 1), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        focusedBorder: OutlineInputBorder (
            borderSide: BorderSide(color: Color.fromRGBO(141, 141, 148, 1), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        contentPadding: EdgeInsets.only(left: 16, top: 10, bottom: 9),
      ),
    );
  }
}