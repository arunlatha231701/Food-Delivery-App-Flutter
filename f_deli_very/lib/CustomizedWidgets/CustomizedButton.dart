import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomizedButton extends StatefulWidget {
  const CustomizedButton(
      {Key? key,
      required this.name,
      required this.marginTop,
      required this.marginBottom, required this.onTap})
      : super(key: key);
  final String name;
  final double marginTop;
  final double marginBottom;

  final void Function()? onTap;
  @override
  State<CustomizedButton> createState() => _CustomizedButtonState();
}

class _CustomizedButtonState extends State<CustomizedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 55,
        margin: EdgeInsets.only(
          top: widget.marginTop,
          bottom: widget.marginBottom,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          widget.name,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
