import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextInputField extends StatefulWidget {
  final String name;
  final String label;
  final int? maxLine;
  final TextInputType inputType;
  final bool? isSearchField;
  final bool? isObscureText;
  final String? Function(String?)? validator;

  const TextInputField({
    Key? key,
    required this.name,
    required this.label,
    this.maxLine,
    this.inputType = TextInputType.text,
    this.isSearchField = false,
    this.isObscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool isSelected = false;

  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {
      if (_focus.hasFocus) {
        isSelected = true;
      } else {
        isSelected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FormBuilderTextField(
        obscureText: widget.isObscureText!,
        validator: widget.validator,
        maxLines: widget.maxLine ?? 1,
        cursorColor: ThemeColors.coral400,
        focusNode: _focus,
        name: widget.name,
        style: textTheme.labelMedium,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          suffixIconConstraints: const BoxConstraints(maxHeight: 24),
          suffixIcon: widget.isSearchField!
              ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.search,
                    color:
                        isSelected ? ThemeColors.coral500 : ThemeColors.gray500,
                  ))
              : null,
          fillColor: Colors.white,
          alignLabelWithHint: true,
          labelText: widget.label,
          labelStyle: TextStyle(
            color: isSelected ? ThemeColors.coral500 : ThemeColors.gray500,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: ThemeColors.red500)),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: ThemeColors.gray200)),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: ThemeColors.coral500)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: ThemeColors.red500)),
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
