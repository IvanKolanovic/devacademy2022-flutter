import 'package:flutter/material.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:devcademy_flutter/assets.dart';
import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/form-fields/text_input_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../bottom-navigation-tabs-screen/bottom_navigation_tabs_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.images.wallpaper),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ThemeColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: MediaQuery.of(context).size.width,
              //height: 353,
              child: FormBuilder(
                key: _formKey,
                onChanged: () {
                  _formKey.currentState!.save();
                },
                autovalidateMode: AutovalidateMode.disabled,
                initialValue: {
                  'email': '',
                  'password': '',
                  'checkbox': _toggled,
                },
                skipDisabled: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Staycation',
                        style: textTheme.headline5!
                            .merge(TextStyle(color: ThemeColors.black))),
                    Text('Get started for free',
                        style: textTheme.bodyText2!
                            .merge(TextStyle(color: ThemeColors.gray500))),
                    const SizedBox(height: 32),
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
                      name: 'password',
                      label: 'Password',
                      isObscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Password is required'),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: ThemeColors.mint400,
                          value: _toggled,
                          onChanged: (bool? value) {
                            setState(() {
                              _toggled = value!;
                            });
                          },
                        ),
                        Text('I accept the Terms and Conditions',
                            style: textTheme.bodyText1!
                                .merge(TextStyle(color: ThemeColors.teal800))),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _toggled
                              ? ThemeColors.mint400
                              : ThemeColors.gray400,
                          onPrimary: ThemeColors.white,
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {},
                        child: const Text('LOG IN'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
