import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/ui/widgets/text_fields.dart';
import 'package:freightcab_shipper/ui/widgets/validators.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'home.dart';

class EditTeamMember extends StatefulWidget {
  final Me$Query$Me$Shipper$Users shipper;

  const EditTeamMember({
    Key key,
    @required this.shipper,
  }) : super(key: key);

  @override
  _EditTeamMemberState createState() => _EditTeamMemberState();
}

class _EditTeamMemberState extends State<EditTeamMember> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  //
  TextEditingController nameController;
  String savedName;
  String nameError;

  TextEditingController surnameController;
  String savedSurname;
  String surnameError;

  MaskedTextController _maskedPhoneController;
  String savedPhone;
  String phoneError;

  TextEditingController emailController;
  String savedEmail;
  String emailError;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.shipper.firstname);
    surnameController = TextEditingController(text: widget.shipper.lastname);
    _maskedPhoneController = MaskedTextController(
        text: widget.shipper.phone, mask: '(000) 000-0000');
    emailController = TextEditingController(text: widget.shipper.email);
    super.initState();
  }

  void onEdited() {
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
          document: UpdateShipperUserMutation().document,
          onCompleted: (dynamic resultData) {
            // print('added result');
            // print(resultData);
            if (resultData != null) {
              print("result team line 150");
              onEdited();
            }
          },
          onError: (e) {
            print('edit shipper error');
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
              ['firstname', 'lastname', 'email', 'phone'],
            );

            if (validationErrors.isNotEmpty) {
              setState(() {
                nameError = validationErrors['firstname'];
                surnameError = validationErrors['lastname'];
                emailError = validationErrors['email'];
                phoneError = validationErrors['phone'];
              });
              //TODO text
              showSnackbar(context, 'Please check entered fields', false);
            } else if (e.graphqlErrors.isNotEmpty) {
              //TODO error message uppercase ('user not found')

              print('error message');
              print(e.graphqlErrors[0].message);

              showSnackbar(context,
                  e.graphqlErrors[0].message ?? 'Something went wrong', false);
            } else {
              showSnackbar(context, 'Something went wrong', false);
            }
          },
        ),
        builder: (runMutation, result) {
          print("runmutation builder shipper edit result");
          print(result);
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
                      'Edit shipper',
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
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Example: John',
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
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: surnameController,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Example: Alexson',
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
                    const SizedBox(height: 8),
                    MyPhoneTextField(
                      controller: _maskedPhoneController,
                      onChanged: (v) {
                        if (phoneError != null) {
                          setState(() => phoneError = null);
                        }
                      },
                      enabled: false,
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
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: 'Example: info@soluchain.com',
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
                                        data: Theme.of(context).copyWith(
                                            accentColor: Colors.white),
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
                                padding: MaterialStateProperty.resolveWith<
                                    EdgeInsets>((states) {
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
        });
  }

  void onSubmitTap(RunMutation runMutation) {
    hideKeyboard();

    if (isLoading) {
      return;
    }

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      var lastSavedPhone = getMaskedData(savedPhone);
      runMutation(
        UpdateShipperUserArguments(
          id: widget.shipper.id,
          firstname: savedName,
          lastname: savedSurname,
          email: savedEmail,
          phone: lastSavedPhone,
        ).toJson(),
      );
    }
  }
}
