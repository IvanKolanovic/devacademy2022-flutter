import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SelectInputField extends StatefulWidget {
  final String name;
  final String label;
  final List<String> options;

  const SelectInputField({
    Key? key,
    required this.name,
    required this.label,
    required this.options,
  }) : super(key: key);

  @override
  State<SelectInputField> createState() => _SelectInputFieldState();
}

class _SelectInputFieldState extends State<SelectInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
        isExpanded: false,
        style: textTheme.labelMedium,
        decoration: InputDecoration(
          fillColor: Colors.white,
          alignLabelWithHint: true,
          labelText: widget.label,
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: ThemeColors.gray200)),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: ThemeColors.coral500)),
          contentPadding: const EdgeInsets.all(10),
        ),
        name: widget.name,
        validator: FormBuilderValidators.required(
          errorText: 'Field is required'),
        items: [
          ...widget.options.map(
            (type) => DropdownMenuItem(
              value: type.toLowerCase(),
              child: Text(type),
            ),
          ),
        ]);
  }
}
