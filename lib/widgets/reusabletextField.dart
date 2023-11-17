import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReuableTextFormField extends StatefulWidget {
  TextEditingController controller;
  final String hintText, validationtext;
  String? CoustomIcon;
  final Icon icon;
  final TextInputType keyboardType;
  final bool passwordField;
  final bool showSuffixIcon, needcoustomIcon;

  ReuableTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.passwordField = false,
    required this.validationtext,
    required this.icon,
    this.showSuffixIcon = true,
    required this.keyboardType,
    this.needcoustomIcon = false,
    this.CoustomIcon,
  }) : super(key: key);

  @override
  _ReuableTextFormFieldState createState() => _ReuableTextFormFieldState();
}

class _ReuableTextFormFieldState extends State<ReuableTextFormField> {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: toggle,
      builder: (context, value, child) {
        return TextFormField(
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          obscureText: widget.passwordField && toggle.value,
          decoration: InputDecoration(
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            hintText: widget.hintText,
            suffixIcon: widget.showSuffixIcon
                ? InkWell(
                    onTap: () {
                      toggle.value = !toggle.value;
                    },
                    child: Icon(
                        toggle.value ? Icons.visibility : Icons.visibility_off),
                  )
                : null,
            prefixIcon: widget.needcoustomIcon == true
                ? SvgPicture.asset(widget.CoustomIcon.toString())
                : widget.icon,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return widget.validationtext;
            } else
              return null;
          },
        );
      },
    );
  }
}
