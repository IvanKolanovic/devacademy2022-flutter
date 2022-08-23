import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/form-fields/date_input_field.dart';
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

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({Key? key}) : super(key: key);

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  int _counter = 0;

  Widget _incrementButton() {
    return SizedBox(
      width: 26,
      height: 26,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ThemeColors.white,
            elevation: 0,
            shape: CircleBorder(
              side: BorderSide(color: ThemeColors.gray300, width: 1.5),
            ),
          ),
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: SvgPicture.asset(
            Assets.icons.plus,
            color: ThemeColors.gray300,
          )),
    );
  }

  Widget _decrementButton() {
    return SizedBox(
      width: 26,
      height: 26,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ThemeColors.white,
          elevation: 0,
          shape: CircleBorder(
            side: BorderSide(color: ThemeColors.gray300, width: 1.5),
          ),
        ),
        onPressed: () {
          setState(() {
            if (_counter > 0) {
              _counter--;
            }
          });
        },
        child: SvgPicture.asset(
          Assets.icons.remove,
          color: ThemeColors.gray300,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.white,
        elevation: 0,
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
                initialValue: const {
                  'search_string': '',
                  'check_in': null,
                  'check_out': null,
                  'guest_num': 0,
                  'accommodation_type': '',
                },
                skipDisabled: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Search places',
                        textAlign: TextAlign.center,
                        style: textTheme.headline6!.merge(
                          TextStyle(color: ThemeColors.teal800),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const TextInputField(
                      name: 'search_string',
                      label: 'Search',
                      isSearchField: true,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: const [
                        Flexible(
                          child: DateInputField(
                            name: 'check_in',
                            label: 'Check in',
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: DateInputField(
                            name: 'check_out',
                            label: 'Check out',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Number of guests',
                          style: textTheme.bodyLarge!.merge(
                            TextStyle(color: ThemeColors.black),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _decrementButton(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                              child: Text(
                                '$_counter',
                                style: textTheme.bodyLarge!.merge(
                                  TextStyle(color: ThemeColors.black),
                                ),
                              ),
                            ),
                            _incrementButton(),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text('Accommodation type',
                        style: textTheme.bodyLarge!
                            .merge(TextStyle(color: ThemeColors.black))),
                    const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: ThemeColors.white,
                              onPrimary: ThemeColors.gray300,
                              elevation: 0,
                              shape: StadiumBorder(
                                side: BorderSide(
                                    color: ThemeColors.gray300, width: 1.5),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: Text('Apartment'),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: ThemeColors.white,
                              onPrimary: ThemeColors.gray300,
                              elevation: 0,
                              shape: StadiumBorder(
                                side: BorderSide(
                                    color: ThemeColors.gray300, width: 1.5),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: Text('Room'),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: ThemeColors.white,
                              onPrimary: ThemeColors.gray300,
                              elevation: 0,
                              shape: StadiumBorder(
                                side: BorderSide(
                                    color: ThemeColors.gray300, width: 1.5),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: Text('Mobile home'),
                            ),
                          )
                        ]),
                    const SizedBox(height: 32),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ThemeColors.mint400,
                          onPrimary: ThemeColors.white,
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          final FormScreenArguments args = FormScreenArguments(
                              _formKey.currentState!.value['search_string'],
                              false);
                          router.toFilteredAccommodations(
                              context, Routes.apartmentsListScreen, args);
                        },
                        child: const Text('SEARCH'),
                      ),
                    ),
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
