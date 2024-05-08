// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final Color? backgroundColor;
  final bool isPassword;
  final String hintText;
  final String? text;
  final String? validateEmptyText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? labelText;
  final String? suffixText;
  final bool? required;
  final bool? showLabel;
  final Color? hintColor;
  final Color? labelColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? borderColor;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final bool enabled;
  final List<String>? autoFillHints;
  final double? radius;
  final double horizontalPadding;
  final double verticalPadding;
  final double? contentVerticalPadding;
  final double? contentHorizontalPadding;
  final Function(String value)? onChanged;
  final Function(String? value)? onSaved;
  final Function(String value)? onFieldSubmitted;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function()? onEditingComplete;
  final bool readOnly;
  final Function()? onTap;
  final TextAlign? textAlign;

  const CustomTextFormField({
    super.key,
    this.onTap,
    this.readOnly = false,
    this.backgroundColor,
    this.isPassword = false,
    required this.hintText,
    this.text,
    this.validateEmptyText,
    this.controller,
    required this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.labelText,
    this.suffixText,
    this.required,
    this.showLabel = false,
    this.hintColor,
    this.labelColor,
    this.textColor,
    this.fillColor = Colors.white,
    this.borderColor = Colors.grey,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.enabled = true,
    this.autoFillHints,
    this.radius = 23,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
    this.validator,
    this.onEditingComplete,
    this.contentVerticalPadding,
    this.contentHorizontalPadding,
    this.textAlign,
    this.minLines,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isSecure = false;

  @override
  void initState() {
    super.initState();
    isSecure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontalPadding,
        vertical: widget.verticalPadding,
      ),
      child: TextFormField(
        readOnly: widget.readOnly,
        inputFormatters: widget.inputFormatters,
        obscureText: isSecure,
        style: TextStyle(
          fontSize: 14,
          color: widget.textColor ??
              Theme.of(context).textTheme.titleMedium!.color,
        ),
        autocorrect: false,
        onTap: widget.onTap,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        autofillHints: widget.autoFillHints,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        textAlign: widget.textAlign ?? TextAlign.start,
        onEditingComplete: widget.onEditingComplete,
        onSaved: widget.onSaved,
        validator: widget.validator,
        maxLines: widget.isPassword ? 1 : widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          labelText: widget.showLabel! ? widget.hintText : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            color: widget.hintColor ?? const Color(0xFF929292),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.contentVerticalPadding ?? 18,
            horizontal: widget.contentHorizontalPadding ?? 16,
          ),
          alignLabelWithHint: true,
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  size: 20,
                  color: widget.prefixIconColor ?? Colors.grey,
                )
              : null,
          suffixText: widget.suffixText ?? '',
          suffixStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          errorBorder: InputBorder.none,
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: widget.isPassword ? _toggle : null,
                  child: Icon(
                    isSecure ? Icons.remove_red_eye : Icons.visibility_off,
                    size: 20,
                    color: widget.suffixIconColor ?? Colors.grey,
                  ),
                )
              : widget.suffixIcon,
          enabled: widget.enabled,
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: widget.borderColor ?? Colors.grey.withOpacity(.3),
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 23),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 23),
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey.withOpacity(.3),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      isSecure = !isSecure;
    });
  }
}
