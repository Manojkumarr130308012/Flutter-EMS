import 'package:flutter/material.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/context_entension.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/num_extensions.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/typedef.dart';
import 'custom_text.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.title,
    this.isPassword = false,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });

  final String? hintText;
  final String? title;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final ValidatorFunction validator;
  final bool? isPassword;
  final TextInputType? keyboardType;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.ph,
        CustomText(
          widget.title ?? "",
          textStyle: context.textTheme.titleMedium,
        ),
        10.ph,
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onSaved: widget.onSaved,
          cursorColor: ColorConstants.teal,
          obscureText: widget.isPassword ?? false,
          // style: GoogleFonts.montserrat(),
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(widget.prefixIcon),
            prefixIconColor: Colors.grey,
            // errorStyle: GoogleFonts.montserrat(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: ColorConstants.teal)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: ColorConstants.teal)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: ColorConstants.teal)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red)),
          ),
        ),
      ],
    );
  }
}
