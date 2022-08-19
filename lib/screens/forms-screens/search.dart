import 'package:devcademy_flutter/shared/widgets/app_bar.dart';
import 'package:devcademy_flutter/shared/widgets/custom_leading.dart';
import 'package:devcademy_flutter/shared/widgets/forms/chip.dart';
import 'package:devcademy_flutter/shared/widgets/forms/date_input_field.dart';
import 'package:devcademy_flutter/shared/widgets/forms/text_input_field.dart';
import 'package:devcademy_flutter/shared/widgets/forms/touch_spin.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: MyAppBar(
          hideShadow: true,
          leading: const CustomLeading(
            icon: Icon(Icons.close),
            tooltip: "Discard",
          ),
          name: '',
          key: UniqueKey(),
        ),
        body: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            onChanged: () {
              _formKey.currentState!.save();
              debugPrint(_formKey.currentState!.value.toString());
            },
            autovalidateMode: AutovalidateMode.disabled,
            skipDisabled: true,
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'Search places',
                    style: textTheme.titleLarge!
                        .merge(const TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 30),
                const TextInputField(
                  isSearchField: true,
                  name: 'search',
                  label: 'Search',
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Flexible(
                      child: DateInputField(
                        name: 'checkIn',
                        label: 'Check in',
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      child: DateInputField(
                        name: 'checkOut',
                        label: 'Check out',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Number of guests',
                        style: textTheme.bodyLarge!
                            .merge(const TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(width: 20),
                      const Flexible(
                        child: TouchSpin(
                          max: 50,
                          min: 1,
                          name: 'capacity',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const MyChip(name: "accomodationType"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
