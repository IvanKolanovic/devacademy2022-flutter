import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/form-fields/select_input_field.dart';
import 'package:devcademy_flutter/form-fields/text_input_field.dart';
import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/models/accommodation.dart';
import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EditNewPlaceScreen extends StatefulWidget {
  const EditNewPlaceScreen({Key? key}) : super(key: key);

  @override
  State<EditNewPlaceScreen> createState() => _EditNewPlaceScreenState();
}

class _EditNewPlaceScreenState extends State<EditNewPlaceScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    Accommodation? initialValues =
        ModalRoute.of(context)!.settings.arguments as Accommodation?;
    bool isEditMode = initialValues != null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.white,
        elevation: 2,
        iconTheme: IconThemeData(
          color: ThemeColors.teal800,
        ),
        leading: IconButton(
          iconSize: 24,
          icon: SvgPicture.asset(Assets.icons.close),
          color: ThemeColors.teal800,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: isEditMode
            ? Text('Edit my place',
                style: textTheme.headline6!
                    .merge(TextStyle(color: ThemeColors.teal800)))
            : Text('Add new place',
                style: textTheme.headline6!
                    .merge(TextStyle(color: ThemeColors.teal800))),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: ThemeColors.teal800,
              textStyle: textTheme.button,
              shape: const CircleBorder(),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                Accommodation value = Accommodation(
                  id: initialValues?.id ?? '',
                  title: _formKey.currentState!.value['listing_name'],
                  location: _formKey.currentState!.value['location'],
                  imageUrl: _formKey.currentState!.value['listing_image'],
                  price: int.parse(_formKey.currentState!.value['price']),
                  categorization:
                      int.parse(_formKey.currentState!.value['categorization']),
                  longDescription:
                      _formKey.currentState!.value['long_description'],
                  shortDescription:
                      _formKey.currentState!.value['short_description'],
                  capacity: int.parse(_formKey.currentState!.value['capacity']),
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
            child: const Text('SAVE'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 24),
              FormBuilder(
                key: _formKey,
                onChanged: () {
                  _formKey.currentState!.save();
                },
                autovalidateMode: AutovalidateMode.disabled,
                initialValue: {
                  'listing_name': initialValues?.title,
                  'short_description': initialValues?.longDescription,
                  'long_description': initialValues?.shortDescription,
                  'listing_image': initialValues?.imageUrl,
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
                    TextInputField(
                      name: 'listing_name',
                      label: 'Listing name',
                      validator: FormBuilderValidators.required(
                          errorText: 'listing name is required'),
                    ),
                    const SizedBox(height: 20),
                    TextInputField(
                      name: 'short_description',
                      label: 'Short description',
                      validator: FormBuilderValidators.required(
                          errorText: 'short description is required'),
                    ),
                    const SizedBox(height: 20),
                    TextInputField(
                      name: 'long_description',
                      label: 'Long description',
                      validator: FormBuilderValidators.required(
                          errorText: 'long description is required'),
                      maxLine: 5,
                    ),
                    const SizedBox(height: 20),
                    TextInputField(
                      name: 'categorization',
                      label: 'Categorization (Number of stars)',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'categorization is required'),
                        FormBuilderValidators.numeric(
                          errorText: 'categorization must be a number'),
                        FormBuilderValidators.integer(),
                        FormBuilderValidators.min(1),
                        FormBuilderValidators.max(5),
                      ]),
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
                    TextInputField(
                      name: 'capacity',
                      label: 'Capacity',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'capacity is required'),
                        FormBuilderValidators.numeric(
                          errorText: 'capacity must be a number'),
                        FormBuilderValidators.min(0, inclusive: false),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextInputField(
                      name: 'price',
                      label: 'Price',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'price is required'),
                        FormBuilderValidators.numeric(
                          errorText: 'price must be a number'),
                        FormBuilderValidators.min(0),
                      ]),
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          child: TextInputField(
                            name: 'location',
                            label: 'Location',
                            validator: FormBuilderValidators.required(
                              errorText: 'location is required'),
                            inputType: TextInputType.streetAddress,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: TextInputField(
                            name: 'postal_code',
                            label: 'Postal code',
                            validator: FormBuilderValidators.required(
                              errorText: 'postal code is required'),
                            inputType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextInputField(
                      name: 'listing_image',
                      label: 'listing image URL',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'URL is required'),
                        FormBuilderValidators.url(
                          errorText: 'input must be a URL'),
                      ]),
                    ),
                    FormBuilderSwitch(
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
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
