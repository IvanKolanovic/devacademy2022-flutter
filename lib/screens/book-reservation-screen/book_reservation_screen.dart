import 'package:devcademy_flutter/http.dart';
import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/screens/my-bookings-screen/my_bookings_screen.dart';
import 'package:flutter/material.dart';

import 'package:devcademy_flutter/theme.dart';
import 'package:intl/intl.dart';

import '../../shared-widgets/searchbar.dart';
import 'package:devcademy_flutter/screens/book-reservation-screen/reservation_card.dart';

import '../../models/accommodation.dart';
import '../../models/reservation.dart';

import 'package:devcademy_flutter/form-fields/text_input_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:devcademy_flutter/form-fields/date_input_field.dart';

class BookReservationScreen extends StatefulWidget {
  const BookReservationScreen({Key? key}) : super(key: key);

  @override
  State<BookReservationScreen> createState() => _BookReservationScreenState();
}

class _BookReservationScreenState extends State<BookReservationScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  void confirmReservation (Accommodation myAccommodation, Reservation newReservation){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => 
        AlertDialog(
          title: Text(
            'Confirm booking',
            style: textTheme.headline5!
                .merge(TextStyle(color: ThemeColors.black))),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(myAccommodation.title, style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))),
              newReservation.numberOfGuests > 1 ? Text('${newReservation.numberOfGuests} guests', style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800)))
                                                : Text('${newReservation.numberOfGuests} guest', style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))),
              Text('${DateFormat('dd MMMM').format(newReservation.checkIn)} - ${DateFormat('dd MMMM y').format(newReservation.checkOut)}', style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))),
              Text(myAccommodation.accommodationType, style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))),
              Text(myAccommodation.location, style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))),
              Text('EUR ${myAccommodation.price}', style: textTheme.bodyText2!.merge(TextStyle(color: ThemeColors.teal800))),
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                primary: ThemeColors.mint400,
                textStyle: textTheme.button,
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('CANCEL'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: ThemeColors.mint400,
                textStyle: textTheme.button,
              ),
              onPressed: () async => await http.addMyReservation(newReservation).then((_) {
                Navigator.of(context).pop();
                const MyBookingsScreen();
              }),
              child: const Text('CONFIRM'),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double offset = 105.5;

    final myAccommodation = ModalRoute.of(context)!.settings.arguments as Accommodation;

    return Scaffold(
      appBar: const SearchBar(title: 'Book your stay'),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight - offset,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: ReservationCard(accommodation: myAccommodation),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: FormBuilder(
                      key: _formKey,
                      onChanged: () {
                        _formKey.currentState!.save();
                      },
                      autovalidateMode: AutovalidateMode.disabled,
                      initialValue: const {
                        'full_name': '',
                        'email': '',
                        'guest_num': '',
                        'check_in': null,
                        'check_out': null,
                      },
                      skipDisabled: true,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 24),
                          TextInputField(
                            name: 'full_name',
                            label: 'Full name',
                            validator: FormBuilderValidators.required(
                                errorText: 'Email is required'),
                          ),
                          const SizedBox(height: 16),
                          TextInputField(
                            name: 'email',
                            label: 'Email',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Email is required'),
                              FormBuilderValidators.email(
                                  errorText: 'Value must be a valid email'),
                            ]),
                          ),
                          const SizedBox(height: 16),
                          TextInputField(
                            name: 'guest_num',
                            label: 'Number of guests',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Number of guests is required'),
                              FormBuilderValidators.numeric(
                                  errorText: 'Input must be a number'),
                              FormBuilderValidators.integer(),
                              FormBuilderValidators.min(1),
                            ]),
                            inputType: TextInputType.number,
                          ),
                          const SizedBox(height: 16),
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
                          SizedBox(height: offset)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ThemeColors.mint400,
                      onPrimary: ThemeColors.white,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Reservation value = Reservation(
                          id: '',
                          homesAllId: '1',
                          fullName: _formKey.currentState!.value['full_name'],
                          email: _formKey.currentState!.value['email'],
                          numberOfGuests: int.parse(_formKey.currentState!.value['guest_num']),
                          checkIn: _formKey.currentState!.value['check_in'],
                          checkOut: _formKey.currentState!.value['check_out'],
                        );

                        confirmReservation(myAccommodation, value);
                      }
                    },
                    child: const Text('BOOK YOUR STAY'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}