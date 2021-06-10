import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/views/terms_n_conditions.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/ui/widgets/text_fields.dart';
import 'package:freightcab_shipper/ui/widgets/validators.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'sign_in_otp.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  final firstnameController = TextEditingController();
  String savedFirstname;
  String firstnameError;

  final surnameController = TextEditingController();
  String savedSurname;
  String surnameError;

  final emailController = TextEditingController();
  String savedEmail;
  String emailError;

  final _maskedPhoneController = MaskedTextController(mask: '(000) 000-0000');
  String savedPhone;
  String phoneError;

  final companyController = TextEditingController();
  String savedCompany;
  String companyError;

  bool isTin = true;
  List<String> items = ['TIN', 'EIN'];
  String mcdotselected = 'TIN';

  final tinController = MaskedTextController(mask: '000-000-000');
  String savedTin;
  String tinError;

  final einController = MaskedTextController(mask: '00_0000000');
  String savedEin;
  String einError;

  bool _readTerms = false;
  String termsError;

  void onSubmitTap(RunMutation runMutation) {
    hideKeyboard();
    if (isLoading) {
      return;
    }

    if (!_readTerms) {
      setState(() => termsError = 'This field is required.');
      return;
    }

    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      if (isTin)
        setState(() => savedTin = getMaskedData(savedTin));
      else
        setState(() => savedEin = getMaskedData(savedEin));

      runMutation(SignUpArguments(
        company_name: savedCompany,
        email: savedEmail,
        phone: getMaskedData(savedPhone),
        tin_ein_number: isTin ? 'tin_$savedTin' : 'ein_$savedEin',
        firstname: savedFirstname,
        lastname: savedSurname,
      ).toJson());
    }
  }

  void onRegistered() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute<dynamic>(
          builder: (context) => SignInOtpScreen(getMaskedData(savedPhone))),
      (route) => route.isFirst,
    );
  }

  Widget buildFormBody(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: SignUpMutation().document,
        onCompleted: (dynamic resultData) {
          if (resultData != null) {
            onRegistered();
          }
        },
        onError: (e) {
          print(e);
          if (e.linkException != null) {
            showSnackbar(
                context,
                'Something went wrong, please check your network connection and try again.',
                false);
            return;
          }

          final validationErrors = findValidationErrors(
            e.graphqlErrors,
            [
              'firstname',
              'lastname',
              'email',
              'phone',
              'tin_ein_number',
              'company_name',
            ],
          );

          if (validationErrors.isNotEmpty) {
            setState(() {
              firstnameError = validationErrors['firstname'];
              surnameError = validationErrors['lastname'];
              emailError = validationErrors['email'];
              phoneError = validationErrors['phone'];
              if (isTin) {
                einError = null;
                tinError = validationErrors['tin_ein_number'];
              } else {
                einError = validationErrors['tin_ein_number'];
                tinError = null;
              }
              companyError = validationErrors['company_name'];
            });

            showSnackbar(context, 'Please check entered fields', false);
          } else if (e.graphqlErrors.isNotEmpty) {
            showSnackbar(context,
                e.graphqlErrors[0].message ?? 'Something went wrong', false);
          } else {
            showSnackbar(context, 'Something went wrong', false);
          }
        },
      ),
      builder: (runMutation, result) {
        isLoading = result.isLoading;
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let’s get started',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: firstnameController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Example: John',
                  errorText: firstnameError,
                ),
                validator: validateFirstName,
                onChanged: (v) {
                  if (firstnameError != null) {
                    setState(() => firstnameError = null);
                  }
                },
                onSaved: (v) => savedFirstname = v,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: surnameController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Surname',
                  hintText: 'Example: Doe',
                  errorText: surnameError,
                ),
                validator: validateLastName,
                onChanged: (v) {
                  if (surnameError != null) {
                    setState(() => surnameError = null);
                  }
                },
                onSaved: (v) => savedSurname = v,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Example: help@soluchain.com',
                  errorText: emailError,
                ),
                validator: validateEmail,
                onChanged: (v) {
                  if (emailError != null) {
                    setState(() => emailError = null);
                  }
                },
                onSaved: (v) => savedEmail = v,
              ),
              const SizedBox(height: 14),
              MyPhoneTextField(
                controller: _maskedPhoneController,
                onChanged: (v) {
                  if (phoneError != null) {
                    setState(() => phoneError = null);
                  }
                },
                onSaved: (v) => savedPhone = v,
                phoneError: phoneError,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: companyController,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Company name',
                  hintText: 'Example: Soluchain',
                  errorText: companyError,
                ),
                validator: validateCompanyName,
                onChanged: (v) {
                  if (companyError != null) {
                    setState(() => companyError = null);
                  }
                },
                onSaved: (v) => savedCompany = v,
              ),
              const SizedBox(height: 14),
              // SizedBox(height: 4),
              //TODO better tin/ein switcher
              //TODO tin format xxx-xxx-xxx-xxx
              //TODO ein format xx-xxxxxxxxx
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PopupMenuButton<String>(
                    child: Container(
                      width: 60,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).primaryColor,
                      ),
                      margin: const EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 5),
                          Text(
                            mcdotselected,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    onSelected: (String value) {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      setState(() {
                        mcdotselected = value;
                        if (value == 'TIN') {
                          isTin = true;
                        } else {
                          isTin = false;
                        }
                      });
                    },
                    itemBuilder: (BuildContext context) {
                      return items.map<PopupMenuItem<String>>((String value) {
                        return new PopupMenuItem(
                            child: new Text(value), value: value);
                      }).toList();
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: isTin ? tinController : einController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: isTin ? 'TIN number' : 'EIN number',
                        hintText: isTin
                            ? 'Example: XXX-XXX-XXX'
                            : 'Example: XX-XXXXXXX',
                        errorText: isTin ? tinError : einError,
                      ),
                      validator: validateTinEin,
                      onChanged: (v) {
                        if (isTin) {
                          if (tinError != null) {
                            setState(() => tinError = null);
                          }
                        } else {
                          if (einError != null) {
                            setState(() => einError = null);
                          }
                        }
                      },
                      onSaved: (v) {
                        if (isTin) {
                          savedTin = v;
                        } else {
                          savedEin = v;
                        }
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(isTin ? 11 : 10),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                width: double.infinity,
                padding: EdgeInsets.only(top: 16, right: 12, bottom: 16),
                child: Row(
                  children: [
                    Checkbox(
                      value: _readTerms,
                      onChanged: (v) {
                        if (termsError != null) {
                          setState(() => termsError = null);
                        }
                        setState(() => _readTerms = v);
                      },
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "I have read and agree to the ",
                            ),
                            TextSpan(
                              text: "Shipper Terms and conditions ",
                              style: TextStyle(color: Colors.blue.shade900),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => navigateTo(
                                    context, (_) => TermsAndConditionsScreen()),
                            ),
                            TextSpan(
                              text:
                                  "and Shipment Policies authorize business verification and credit check",
                            ),
                          ],
                          style: TextStyle(fontSize: 14),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              if (termsError != null)
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    termsError,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              SizedBox(
                width: double.infinity,
                child: AbsorbPointer(
                  absorbing: result.isLoading,
                  child: ElevatedButton(
                    onPressed: () => onSubmitTap(runMutation),
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 14)),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 150),
                      child: result.isLoading
                          ? Theme(
                              data: Theme.of(context)
                                  .copyWith(accentColor: Colors.white),
                              child: const ProgressIndicatorSmall(),
                            )
                          : Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const horPadding = 20.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: horPadding),
          children: [
            const SizedBox(height: 24),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
              ),
              child: buildFormBody(context),
            ),
            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    firstnameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    _maskedPhoneController.dispose();
    companyController.dispose();
    tinController.dispose();
    einController.dispose();
  }

  void onShowPrivacyInfoTap() {
    if (isLoading) {
      return;
    }
    navigateTo(context, (_) => TermsAndConditionsScreen());
  }
}


// 'Freightcab carries out full truckload shipments using dry van and reefer 
// in the states of the USA. We don’t currently support real time 
// quote for your shipment, but we do offer real time location tracking 
// about your shipments.',
// Align(
//   alignment: Alignment.topCenter,
//   child: Center(
//     child: TextButton(
//       onPressed: onShowPrivacyInfoTap,
//       child: Text(
//         'Info about privacy',
//         style: const TextStyle(
//             color: Color(0xff9ba9c6),
//             fontSize: 12,
//             fontWeight: FontWeight.w600),
//       ),
//     ),
//   ),
// ),