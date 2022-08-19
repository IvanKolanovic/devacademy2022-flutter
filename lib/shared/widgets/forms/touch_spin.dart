import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

class TouchSpin extends StatefulWidget {
  final String name;
  final num? initialValue;
  final num min;
  final num max;
  final num? step;
  final String? Function(num?)? validator;

  const TouchSpin({
    Key? key,
    required this.name,
    this.initialValue,
    required this.min,
    required this.max,
    this.step,
    this.validator,
  }) : super(key: key);

  @override
  State<TouchSpin> createState() => _TouchSpinState();
}

class _TouchSpinState extends State<TouchSpin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FormBuilderTouchSpin(
        validator: widget.validator,
        name: widget.name,
        initialValue: widget.initialValue ?? widget.min,
        min: 1,
        step: 1,
        subtractIcon: const Icon(Icons.remove_circle_outline),
        addIcon: const Icon(Icons.add_circle_outline),
        iconSize: 26,
      ),
    );
  }
}
