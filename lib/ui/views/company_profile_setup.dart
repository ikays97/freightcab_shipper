import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/ui/widgets/labeledCheckbox.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CompanyProfileSetupScreen extends StatefulWidget {
  @override
  _CompanyProfileSetupScreenState createState() =>
      _CompanyProfileSetupScreenState();
}

class _CompanyProfileSetupScreenState extends State<CompanyProfileSetupScreen> {
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  //company
  final companyNameController = TextEditingController();
  String savedCompanyName;
  String companyNameError;

  final companyAddressController = TextEditingController();
  String savedCompanyAddress;
  String companyAddressError;

  final addressLineController = TextEditingController();
  String savedAddressLine;
  String addressLineError;

  //TODO city autocomplete?
  final cityController = TextEditingController();
  String savedCity;
  String cityError;

  //TODO state autocomplete?
  final stateController = TextEditingController();
  String savedState;
  String stateError;

  final zipCodeController = TextEditingController();
  String savedZipCode;
  String zipCodeError;

  //tax
  final taxIdController = TextEditingController();
  String savedTaxId;
  String taxIdError;

  //primary contact
  final primaryFullnameController = TextEditingController();
  String savedPrimaryFullname;
  String primaryFullnameError;

  final primaryEmailController = TextEditingController();
  String savedPrimaryEmail;
  String primaryEmailError;

  final primaryPhoneController = TextEditingController();
  String savedPrimaryPhone;
  String primaryPhoneError;

  final primaryExtensionsController = TextEditingController();
  String savedPrimaryExtensions;
  String primaryExtensionsError;

  //TODO same as billing logic
  bool sameAsBilling = true;

  //billing contact
  final billingFullnameController = TextEditingController();
  String savedBillingFullname;
  String billingFullnameError;

  final billingEmailController = TextEditingController();
  String savedBillingEmail;
  String billingEmailError;

  final billingPhoneController = TextEditingController();
  String savedBillingPhone;
  String billingPhoneError;

  final billingExtensionsController = TextEditingController();
  String savedBillingExtensions;
  String billingExtensionsError;

  bool termsChecked = false;

  String validateCompanyName(String value) {
    //TODO validate
    return null;
  }

  String validateCompanyAddress(String value) {
    //TODO validate
    return null;
  }

  String validateAddressLine(String value) {
    //TODO validate
    return null;
  }

  String validateCity(String value) {
    //TODO validate
    return null;
  }

  String validateState(String value) {
    //TODO validate
    return null;
  }

  String validateZipCode(String value) {
    //TODO validate
    return null;
  }

  String validateTaxId(String value) {
    //TODO validate
    return null;
  }

  String validatePrimaryFullname(String value) {
    //TODO validate
    return null;
  }

  String validatePrimaryEmail(String value) {
    //TODO validate
    return null;
  }

  String validatePrimaryPhone(String value) {
    //TODO validate
    return null;
  }

  String validatePrimaryExtensions(String value) {
    //TODO validate
    return null;
  }

  String validateBillingFullname(String value) {
    //TODO validate
    return null;
  }

  String validateBillingEmail(String value) {
    //TODO validate
    return null;
  }

  String validateBillingPhone(String value) {
    //TODO validate
    return null;
  }

  String validateBillingExtensions(String value) {
    //TODO validate
    return null;
  }

  void onSubmitTap(RunMutation runMutation) {
    hideKeyboard();
    if (isLoading) {
      return;
    }
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      //TODO which fields should I send?
      runMutation(UpdateShipperArguments(
        input: UpdateShipperInput(
          address: ShipperAddressInput(
            address: savedCompanyAddress,
            address2: savedAddressLine,
            city: savedCity,
            state: savedState,
            zipCode: int.tryParse(savedZipCode) /*TODO parse*/,
          ),
          billingAddress: BillingAddressInput(
            address: savedCompanyAddress,
            address2: savedAddressLine,
            city: savedCity,
            state: savedState,
            zipCode: int.tryParse(savedZipCode) /*TODO parse*/,
          ),
          billingContact: BillingContactInput(
            email: savedBillingEmail,
            fullname: savedBillingFullname,
            phone: savedBillingPhone,
          ),
          primaryContact: PrimaryContactInput(
            email: savedPrimaryEmail,
            fullname: savedPrimaryFullname,
            phone: savedPrimaryPhone,
          ),
        ),
      ).toJson());
    }
  }

  void onShipperUpdated() {
    //TODO logic
  }

  Widget buildFormBody(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: UpdateShipperMutation().document,
        onCompleted: (dynamic resultData) {
          if (resultData != null) {
            onShipperUpdated();
          }
        },
        onError: (e) {
          //TODO error handling
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
              //TODO fields
              // 'lastname',
              // 'email',
              // 'phone',
            ],
          );

          if (validationErrors.isNotEmpty) {
            setState(() {
              //TODO fields
              // firstnameError = validationErrors['firstname'];
              // surnameError = validationErrors['lastname'];
              // emailError = validationErrors['email'];
            });
            //TODO text
            showSnackbar(context, 'Please check entered fields', false);
          } else if (e.graphqlErrors.isNotEmpty) {
            //TODO error message uppercase ('user not found')
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
                'Company name and address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: companyNameController,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Company name',
                  hintText: 'Example: Soluchain',
                  helperText: '',
                  errorText: companyNameError,
                ),
                validator: validateCompanyName,
                onChanged: (v) {
                  if (companyNameError != null) {
                    setState(() => companyNameError = null);
                  }
                },
                onSaved: (v) => savedCompanyName = v,
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: companyAddressController,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Company address',
                  hintText: 'Example: 1535 Avenue New York',
                  helperText: '',
                  errorText: companyAddressError,
                ),
                validator: validateCompanyAddress,
                onChanged: (v) {
                  if (companyAddressError != null) {
                    setState(() => companyAddressError = null);
                  }
                },
                onSaved: (v) => savedCompanyAddress = v,
              ),
              SizedBox(height: 4),
              //TODO optional
              TextFormField(
                controller: addressLineController,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Address line',
                  hintText: 'Example: 1535 Avenue New York',
                  helperText: '',
                  errorText: addressLineError,
                ),
                validator: validateAddressLine,
                onChanged: (v) {
                  if (addressLineError != null) {
                    setState(() => addressLineError = null);
                  }
                },
                onSaved: (v) => savedAddressLine = v,
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: cityController,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Example: Washington',
                  helperText: '',
                  errorText: cityError,
                ),
                validator: validateCity,
                onChanged: (v) {
                  if (cityError != null) {
                    setState(() => cityError = null);
                  }
                },
                onSaved: (v) => savedCity = v,
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: stateController,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'State',
                  hintText: 'Example: Alabama',
                  helperText: '',
                  errorText: stateError,
                ),
                validator: validateState,
                onChanged: (v) {
                  if (stateError != null) {
                    setState(() => stateError = null);
                  }
                },
                onSaved: (v) => savedState = v,
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: zipCodeController,
                keyboardType: TextInputType.number,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Zip code',
                  hintText: 'Example: 205000',
                  helperText: '',
                  errorText: zipCodeError,
                ),
                validator: validateZipCode,
                onChanged: (v) {
                  if (zipCodeError != null) {
                    setState(() => zipCodeError = null);
                  }
                },
                onSaved: (v) => savedZipCode = v,
              ),
              SizedBox(height: 4),
              //////////
              SizedBox(height: 8),
              Text(
                'Federal Tax ID (TIN/EIN)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: taxIdController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Tax ID',
                  hintText: '9 digits TIN/EIN',
                  helperText: '',
                  errorText: taxIdError,
                ),
                validator: validateTaxId,
                onChanged: (v) {
                  if (taxIdError != null) {
                    setState(() => taxIdError = null);
                  }
                },
                onSaved: (v) => savedTaxId = v,
              ),
              SizedBox(height: 4),
              //////////
              SizedBox(height: 8),
              Text(
                'Primary contract',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                  'The primary contact will receive emails about shipments and will be the main contact if we have questions about this account. You can change the Primary contact later.'),
              SizedBox(height: 16),
              //TODO fill from profile
              TextFormField(
                controller: primaryFullnameController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Primary contact full name',
                  hintText: 'Example: John Doe',
                  helperText: '',
                  errorText: primaryFullnameError,
                ),
                validator: validatePrimaryFullname,
                onChanged: (v) {
                  if (primaryFullnameError != null) {
                    setState(() => primaryFullnameError = null);
                  }
                },
                onSaved: (v) => savedPrimaryFullname = v,
              ),
              SizedBox(height: 4),
              //TODO fill from profile
              TextFormField(
                controller: primaryEmailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Primary contact email address',
                  hintText: 'Example: help@soluchain.com',
                  helperText: '',
                  errorText: primaryEmailError,
                ),
                validator: validatePrimaryEmail,
                onChanged: (v) {
                  if (primaryEmailError != null) {
                    setState(() => primaryEmailError = null);
                  }
                },
                onSaved: (v) => savedPrimaryEmail = v,
              ),
              SizedBox(height: 4),
              //TODO fill from profile
              TextFormField(
                controller: primaryPhoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Primary contact phone number',
                  hintText: 'Example: +1 253 265 287',
                  helperText: '',
                  errorText: primaryPhoneError,
                ),
                validator: validatePrimaryPhone,
                onChanged: (v) {
                  if (primaryPhoneError != null) {
                    setState(() => primaryPhoneError = null);
                  }
                },
                onSaved: (v) => savedPrimaryPhone = v,
              ),
              SizedBox(height: 4),
              //TODO optional
              TextFormField(
                controller: primaryExtensionsController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Extensions optional',
                  hintText: 'Example: 205000',
                  helperText: '',
                  errorText: primaryExtensionsError,
                ),
                validator: validatePrimaryExtensions,
                onChanged: (v) {
                  if (primaryExtensionsError != null) {
                    setState(() => primaryExtensionsError = null);
                  }
                },
                onSaved: (v) => savedPrimaryExtensions = v,
              ),
              SizedBox(height: 4),
              ////////////
              SizedBox(height: 8),
              Text(
                'Billing address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Material(
                type: MaterialType.transparency,
                child: LabeledCheckbox2(
                  label: Text(
                    'This address is also the company',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  contentPadding: EdgeInsets.zero,
                  value: sameAsBilling,
                  onTap: (v) {
                    setState(() => sameAsBilling = v ?? false);
                  },
                ),
              ),
              Text(
                  'Uncheck to edit if the billing address is different from the company address'),
              ////////////
              SizedBox(height: 24),
              Text(
                'Billing contact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                  'We will contact this person when we have questions about financials and billing. This person will also receive emails with invoices, credit limit, and past due notifications.'),
              SizedBox(height: 16),
              //TODO fill from profile
              TextFormField(
                controller: billingFullnameController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Billing contact full name',
                  hintText: 'Example: John Doe',
                  helperText: '',
                  errorText: billingFullnameError,
                ),
                validator: validateBillingFullname,
                onChanged: (v) {
                  if (billingFullnameError != null) {
                    setState(() => billingFullnameError = null);
                  }
                },
                onSaved: (v) => savedBillingFullname = v,
              ),
              SizedBox(height: 4),
              //TODO fill from profile
              TextFormField(
                controller: billingEmailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Billing contact email address',
                  hintText: 'Example: help@soluchain.com',
                  helperText: '',
                  errorText: billingEmailError,
                ),
                validator: validateBillingEmail,
                onChanged: (v) {
                  if (billingEmailError != null) {
                    setState(() => billingEmailError = null);
                  }
                },
                onSaved: (v) => savedBillingEmail = v,
              ),
              SizedBox(height: 4),
              Text('Invoices and POD will be sent to this address'),
              SizedBox(height: 16),
              //TODO fill from profile
              TextFormField(
                controller: billingPhoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Billing contact phone number',
                  hintText: 'Example: +1 253 265 287',
                  helperText: '',
                  errorText: billingPhoneError,
                ),
                validator: validateBillingPhone,
                onChanged: (v) {
                  if (billingPhoneError != null) {
                    setState(() => billingPhoneError = null);
                  }
                },
                onSaved: (v) => savedBillingPhone = v,
              ),
              SizedBox(height: 4),
              //TODO does need this field?
              TextFormField(
                controller: billingExtensionsController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Extensions optional',
                  hintText: 'Example: 205000',
                  helperText: '',
                  errorText: billingExtensionsError,
                ),
                validator: validateBillingExtensions,
                onChanged: (v) {
                  if (billingExtensionsError != null) {
                    setState(() => billingExtensionsError = null);
                  }
                },
                onSaved: (v) => savedBillingExtensions = v,
              ),
              SizedBox(height: 4),
              SizedBox(height: 16),
              Material(
                type: MaterialType.transparency,
                child: LabeledCheckbox2(
                  label: Text.rich(TextSpan(
                    children: [
                      TextSpan(text: 'I have read and agree to the '),
                      TextSpan(
                          text: 'Shipper terms and conditions',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(text: ' and '),
                      TextSpan(
                          text: 'Shipment Policies',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(
                          text:
                              ' authorizie business verification and credit check'),
                    ],
                  )),
                  contentPadding: EdgeInsets.zero,
                  value: termsChecked,
                  onTap: (v) {
                    setState(() => termsChecked = v ?? false);
                  },
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  child: AbsorbPointer(
                    absorbing: isLoading,
                    child: ElevatedButton(
                      onPressed: () => onSubmitTap(runMutation),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                      ),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 150),
                        child: isLoading
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
              ),
              SizedBox(height: 16),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                'Company Profile Setup',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                  'To setup your company’s account, please share your company details including your company’s EIN. Your billing address and contact are needed to get quotes and book shipments.'),
              SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
                ),
                child: buildFormBody(context),
              ),
              SizedBox(height: 56),
            ],
          ),
        ),
      ),
    );
  }
}
