import 'package:flutter/material.dart';

class CustomizedTextFormField extends StatefulWidget {
  const CustomizedTextFormField(
      {Key? key,
      required this.controller,
      required this.focusNode,
      required this.hintText,
      required this.textInputType,

      this.validator,
      required this.focusNodeNext,
      required this.prefixIcon,
      required this.obscureText,
      this.suffixIcon,
      required this.autovalidateMode,
      this.onsaved, required this.name})
      : super(key: key);
  final String name;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? focusNodeNext;
  final String hintText;
  final TextInputType textInputType;
  final Function(String?)? onsaved;
  final FormFieldValidator<String>? validator;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final AutovalidateMode autovalidateMode;

  @override
  State<CustomizedTextFormField> createState() =>
      _CustomizedTextFormFieldState();
}

class _CustomizedTextFormFieldState extends State<CustomizedTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      onFieldSubmitted: (_) => widget.focusNodeNext?.requestFocus(),
      validator: widget.validator,
      cursorColor: Colors.deepOrangeAccent,
      autofocus: true,
      autocorrect: true,
      onSaved: widget.onsaved,
      autovalidateMode: widget.autovalidateMode,
      obscureText: widget.obscureText,
      style: TextStyle(color: Colors.grey.shade400),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade50,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.grey.shade400,
        ),
        hintText: widget.name,
        hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.bold,
            fontSize: 15),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.grey.shade200)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.grey.shade200)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(
                color: Colors.grey.shade200,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignCenter,
                width: 1)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Colors.grey.shade200,
                width: 1.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Colors.grey.shade200,
              width: 1.0,
            )),
      ),
      keyboardType: widget.textInputType,
    );
  }
}
