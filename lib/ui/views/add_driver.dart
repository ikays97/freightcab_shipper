import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/ui/widgets/text_fields.dart';
import 'package:freightcab_shipper/ui/widgets/validators.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'home.dart';

class AddDriverPage extends StatefulWidget {
  @override
  _AddDriverPageState createState() => _AddDriverPageState();
}

class _AddDriverPageState extends State<AddDriverPage> {
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  TextEditingController nameController = TextEditingController();

  String savedName;

  String nameError;

  TextEditingController surnameController = TextEditingController();

  String savedSurname;

  String surnameError;

  final _maskedPhoneController = MaskedTextController(mask: '(000) 000-0000');

  String savedPhone;

  String phoneError;

  TextEditingController emailController = TextEditingController();

  String savedEmail;

  String emailError;

  void onSubmitTap(RunMutation runMutation) {
    hideKeyboard();

    if (isLoading) {
      return;
    }

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      var lastSavedPhone = getMaskedData(savedPhone);
      runMutation(
        AddShipperArguments(
          firstname: savedName,
          lastname: savedSurname,
          email: savedEmail,
          phone: lastSavedPhone,
        ).toJson(),
      );
    }
  }

  void onAdded() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: AddShipperMutation().document,
        onCompleted: (dynamic resultData) {
          if (resultData != null) {
            onAdded();
          }
        },
        onError: (e) {
          if (e.linkException != null) {
            showSnackbar(
                context,
                'Something went wrong, please check your network connection and try again.',
                false);
            return;
          }

          final validationErrors = findValidationErrors(
            e.graphqlErrors,
            ['firstname', 'lastname', 'email', 'phone'],
          );

          if (validationErrors.isNotEmpty) {
            setState(() {
              nameError = validationErrors['firstname'];
              surnameError = validationErrors['lastname'];
              emailError = validationErrors['email'];
              phoneError = validationErrors['phone'];
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
        return Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add shipper',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Firstname",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      errorText: nameError,
                    ),
                    validator: validateFirstName,
                    onChanged: (v) {
                      if (nameError != null) {
                        setState(() => nameError = null);
                      }
                    },
                    onSaved: (v) => savedName = v,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "Lastname",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: surnameController,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      errorText: surnameError,
                    ),
                    validator: validateFirstName,
                    onChanged: (v) {
                      if (surnameError != null) {
                        setState(() => surnameError = null);
                      }
                    },
                    onSaved: (v) => savedSurname = v,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "Phone number",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
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
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
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
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: AbsorbPointer(
                          absorbing: result.isLoading,
                          child: ElevatedButton(
                            onPressed: () =>
                                onSubmitTap(runMutation), // addDriverSubmit,
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 150),
                              child: result.isLoading
                                  ? Theme(
                                      data: Theme.of(context)
                                          .copyWith(accentColor: Colors.white),
                                      child: const ProgressIndicatorSmall(),
                                    )
                                  : Text(
                                      'Save',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.resolveWith<EdgeInsets>(
                                      (states) {
                                return EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    _maskedPhoneController.dispose();
  }
}
