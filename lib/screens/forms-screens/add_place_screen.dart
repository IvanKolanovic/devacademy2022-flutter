import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/shared/models/accomodation.dart';
import 'package:devcademy_flutter/shared/widgets/app_bar.dart';
import 'package:devcademy_flutter/shared/widgets/custom_leading.dart';
import 'package:devcademy_flutter/shared/widgets/forms/select_input_field.dart';
import 'package:devcademy_flutter/shared/widgets/forms/text_input_field.dart';
import 'package:devcademy_flutter/shared/widgets/my_actions.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddEditPlacesScreen extends StatefulWidget {
  const AddEditPlacesScreen({super.key});

  @override
  State<AddEditPlacesScreen> createState() => _AddEditPlacesScreenState();
}

class _AddEditPlacesScreenState extends State<AddEditPlacesScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    Accomodation? initialValues =
        ModalRoute.of(context)!.settings.arguments as Accomodation?;
    bool isEditMode = initialValues != null;

    return Material(
      child: Scaffold(
        appBar: MyAppBar(
          leading: const CustomLeading(
            icon: Icon(Icons.close),
            tooltip: "Discard",
          ),
          name: isEditMode ? 'Edit my place' : 'Add new place',
          actions: [
            CustomAction(
              onPress: () async {
                if (_formKey.currentState!.validate()) {
                  Accomodation value = Accomodation(
                    id: initialValues?.id ?? '',
                    title: _formKey.currentState!.value['listing_name'],
                    location: _formKey.currentState!.value['location'],
                    imageUrl: _formKey.currentState!.value['listing_image'],
                    price: int.parse(_formKey.currentState!.value['price']),
                    categorization: int.parse(
                        _formKey.currentState!.value['categorization']),
                    longDescription:
                        _formKey.currentState!.value['long_description'],
                    shortDescription:
                        _formKey.currentState!.value['short_description'],
                    capacity:
                        int.parse(_formKey.currentState!.value['capacity']),
                    postalCode: _formKey.currentState!.value['postal_code'],
                    freeCancelation:
                        _formKey.currentState!.value['cancellation_available'],
                    accommodationType:
                        _formKey.currentState!.value['accommodation_type'],
                  );
                  isEditMode
                      ? await http.editMyPlace(value)
                      : await http.addMyPlace(value);
                  Navigator.of(context).pop();
                }
              },
              tooltip: "SAVE",
              actionWidget: Text(
                'SAVE',
                style: textTheme.button!
                    .merge(TextStyle(color: ThemeColors.mint500)),
              ),
            ),
          ],
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
            initialValue: {
              'listing_name': initialValues?.title,
              'short_description': initialValues?.longDescription,
              'long_description': initialValues?.shortDescription,
              'categorization': initialValues?.categorization.toString(),
              'accommodation_type': initialValues?.accommodationType,
              'capacity': initialValues?.capacity.toString(),
              'price': initialValues?.price.toString(),
              'location': initialValues?.location,
              'postal_code': initialValues?.postalCode.toString(),
              'cancellation_available': initialValues?.freeCancelation,
            },
            skipDisabled: true,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                const TextInputField(
                  name: 'listing_name',
                  label: 'Listing name',
                ),
                const SizedBox(height: 20),
                const TextInputField(
                  name: 'short_description',
                  label: 'Short description',
                ),
                const SizedBox(height: 20),
                const TextInputField(
                  name: 'long_description',
                  label: 'Long description',
                  maxLine: 5,
                ),
                const SizedBox(height: 20),
                const TextInputField(
                  name: 'categorization',
                  label: 'Categorization (Number of stars)',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                const SelectInputField(
                  name: 'accommodation_type',
                  label: 'Accommodation type',
                  options: [
                    'Apartment',
                    'Room',
                    'Mobile home',
                  ],
                ),
                const SizedBox(height: 20),
                const TextInputField(
                  name: 'capacity',
                  label: 'Capacity',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                const TextInputField(
                  name: 'price',
                  label: 'Price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Flexible(
                      child: TextInputField(
                        name: 'location',
                        label: 'Location',
                        inputType: TextInputType.streetAddress,
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      child: TextInputField(
                        name: 'postal_code',
                        label: 'Postal code',
                        inputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const TextInputField(
                  name: 'listing_image',
                  label: 'Listing image URL',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: FormBuilderSwitch(
                    activeColor: ThemeColors.mint500,
                    activeTrackColor: ThemeColors.mint200,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    name: 'cancellation_available',
                    title: Text(
                      'Free cancellation available',
                      style: textTheme.bodyText2!.merge(
                        TextStyle(
                          color: ThemeColors.teal800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    initialValue: false,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
