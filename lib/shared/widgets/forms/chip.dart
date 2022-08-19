import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

class MyChip extends StatefulWidget {
  final String name;
  final num? initialValue;

  final String? Function(num?)? validator;

  const MyChip({
    Key? key,
    required this.name,
    this.initialValue,
    this.validator,
  }) : super(key: key);

  @override
  State<MyChip> createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FormBuilderFilterChip(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(labelText: 'Accommodation type'),
        name: widget.name,
        labelStyle:
            textTheme.bodyLarge!.merge(const TextStyle(color: Colors.black)),
        selectedColor: Colors.blue,
        options: const [
          FormBuilderChipOption(
            value: 'Room',
          ),
          FormBuilderChipOption(
            value: 'Mobile home',
          ),
          FormBuilderChipOption(
            value: 'Apartment',
          ),
        ],
      ),
    );
  }
}
