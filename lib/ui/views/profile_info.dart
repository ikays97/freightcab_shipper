import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/expansiontiles.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/ui/widgets/text_fields.dart';
import 'package:freightcab_shipper/ui/widgets/validators.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const _primateText =
    "The primary contact will receive emails and notifications about shipments and will be the main contact information if we have concerns about this account. You can change the Primary contact later.";

class ProfileForm extends StatefulWidget {
  final Me$Query$Me me;

  const ProfileForm({Key key, @required this.me}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool canChange = false;
  bool _madeChange = false;
  bool savingLoading = false;
  bool _copyCompany;
  bool _copyPrimary;
  //
  bool isTin = true;
  bool verifyLoading = false;
  //
  TextEditingController companyNameController;
  MaskedTextController taxController;
  TextEditingController companyAddressController;
  String companyAddressError;

  TextEditingController address2Controller;
  String address2Error;

  TextEditingController companyCityController;
  String companyCityError;

  TextEditingController companyZipController;
  String companyZipError;

  String savedState;

  TextEditingController bAddressController;
  String baddressError;

  TextEditingController bAddress2Controller;
  String baddress2Error;

  TextEditingController bCityController;
  String bcityError;

  String savedbstate;

  TextEditingController bZCodeController;
  String bzcodeError;

  TextEditingController pNameController;
  String pnameError;

  TextEditingController pEmailController;
  String pemailError;

  MaskedTextController pphoneMask;
  String pphoneError;

  TextEditingController bContactNameController;
  String bcontactnameError;

  TextEditingController bContactEmailController;
  String bcontactemailError;

  MaskedTextController bphoneMask;
  String bcontactphoneError;

  @override
  void initState() {
    super.initState();
    isTin = widget.me.shipper.tinEinNumber.substring(0, 3) == 'TIN';
    canChange = !widget.me.shipper.verified;
    //
    companyNameController = TextEditingController(text: widget.me.shipper.name);
    taxController = MaskedTextController(
        mask: isTin ? '000-000-000' : '00-0000000',
        text: widget.me.shipper.tinEinNumber.substring(4));
    companyAddressController =
        TextEditingController(text: widget.me.shipper.address?.address);
    address2Controller =
        TextEditingController(text: widget.me.shipper.address?.address2);
    companyCityController =
        TextEditingController(text: widget.me.shipper.address?.city);
    companyZipController = TextEditingController(
        text: widget.me.shipper.address?.zipCode?.toString());
    savedState = widget.me.shipper.address?.state;
    bAddressController =
        TextEditingController(text: widget.me.shipper.billingAddress?.address);
    bAddress2Controller =
        TextEditingController(text: widget.me.shipper.billingAddress?.address2);
    bCityController =
        TextEditingController(text: widget.me.shipper.billingAddress?.city);
    savedbstate = widget.me.shipper.billingAddress?.state;
    bZCodeController = TextEditingController(
        text: widget.me.shipper.billingAddress?.zipCode?.toString());
    pNameController =
        TextEditingController(text: widget.me.shipper.primaryContact.fullname);
    pEmailController =
        TextEditingController(text: widget.me.shipper.primaryContact.email);
    pphoneMask = MaskedTextController(
      mask: '(000) 000-0000',
      text: widget.me.shipper.primaryContact.phone,
    );
    bContactNameController =
        TextEditingController(text: widget.me.shipper.billingContact?.fullname);
    bContactEmailController =
        TextEditingController(text: widget.me.shipper.billingContact?.email);
    bphoneMask = MaskedTextController(
      mask: '(000) 000-0000',
      text: widget.me.shipper.billingContact?.phone,
    );
    _copyCompany = bAddressController.text == companyAddressController.text;
    _copyPrimary = bContactNameController.text == pNameController.text;

    if (bContactNameController.text == '') {
      _copyPrimary = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Company information and address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          TextFormField(
            enabled: canChange,
            controller: companyNameController,
            decoration: InputDecoration(
              labelText: 'Company name',
              suffixIcon: Icon(Icons.lock, color: Color(0xff3370fc)),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).primaryColor,
                ),
                margin: const EdgeInsets.only(right: 5),
                child: Center(
                  child: Text(
                    isTin ? 'TIN' : 'EIN',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  enabled: canChange,
                  controller: taxController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: isTin ? 'TIN number' : 'EIN number',
                    hintText:
                        isTin ? 'Example: XXX-XXX-XXX' : 'Example: XX-XXXXXXX',
                    suffixIcon:
                        Icon(Icons.lock, color: const Color(0xff3370fc)),
                  ),
                  validator: validateTinEin,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(isTin ? 11 : 10),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            enabled: canChange,
            controller: companyAddressController,
            validator: validateCompanyName,
            decoration: InputDecoration(
              labelText: 'Company address',
            ),
            onChanged: (v) {
              if (companyAddressError != null) {
                setState(() => companyAddressError = null);
              }
              setState(() => _madeChange = true);
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            enabled: canChange,
            controller: address2Controller,
            decoration: InputDecoration(
              labelText: 'Address line (optional)',
            ),
            onChanged: (v) {
              if (address2Error != null) {
                setState(() => address2Error = null);
              }
              setState(() => _madeChange = true);
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            enabled: canChange,
            controller: companyCityController,
            validator: validateCity,
            decoration: InputDecoration(
              labelText: 'City',
            ),
            onChanged: (v) {
              if (companyCityError != null) {
                setState(() => companyCityError = v);
              }
              setState(() => _madeChange = true);
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: savedState,
            decoration: InputDecoration(hintText: 'State'),
            onChanged: canChange
                ? (v) {
                    setState(() => _madeChange = true);
                    savedState = v;
                  }
                : null,
            // items: states.map((state) {
            //   return DropdownMenuItem(
            //     child: Text(state),
            //     value: state,
            //   );
            // }).toList(),
          ),
          const SizedBox(height: 16),
          TextFormField(
            enabled: canChange,
            controller: companyZipController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            validator: validateZip,
            decoration: InputDecoration(
              labelText: 'Zip code',
            ),
            onChanged: (v) {
              if (companyZipError != null) {
                setState(() => companyZipError = null);
              }
              setState(() => _madeChange = true);
            },
            inputFormatters: [LengthLimitingTextInputFormatter(5)],
          ),
          const SizedBox(height: 24),
          Text('Billing address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: InverseExpansionTile(
                initiallyExpanded: _copyCompany,
                expandedAlignment: Alignment.topLeft,
                onExpansionChanged: (v) {
                  setState(() {
                    _madeChange = true;
                    _copyCompany = !_copyCompany;
                  });
                },
                title: Text('Same as the company address'),
                children: [
                  TextFormField(
                    enabled: canChange,
                    controller: bAddressController,
                    validator: validateAddress,
                    decoration: InputDecoration(
                      labelText: 'Billing address',
                    ),
                    onChanged: (v) {
                      if (baddressError != null) {
                        setState(() => baddressError = null);
                      }
                      setState(() => _madeChange = true);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    enabled: canChange,
                    controller: bAddress2Controller,
                    decoration: InputDecoration(
                      labelText: 'Address line (optional)',
                    ),
                    onChanged: (v) {
                      if (baddress2Error != null) {
                        setState(() {
                          baddress2Error = null;
                        });
                      }
                      setState(() => _madeChange = true);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    enabled: canChange,
                    controller: bCityController,
                    validator: validateCity,
                    decoration: InputDecoration(
                      labelText: 'City',
                    ),
                    onChanged: (v) {
                      if (bcityError != null) {
                        setState(() => bcityError = null);
                      }
                      setState(() => _madeChange = true);
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: savedbstate,
                    decoration: InputDecoration(hintText: 'State'),
                    onChanged: canChange
                        ? (v) {
                            setState(() => _madeChange = true);
                            savedbstate = v;
                          }
                        : null,
                    // items: states.map((state) {
                    //   return DropdownMenuItem(
                    //     child: Text(state),
                    //     value: state,
                    //   );
                    // }).toList(),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    enabled: canChange,
                    controller: bZCodeController,
                    validator: validateZip,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Zip code',
                    ),
                    onChanged: (v) {
                      if (bzcodeError != null) {
                        setState(() => bzcodeError = null);
                      }
                      setState(() => _madeChange = true);
                    },
                    inputFormatters: [LengthLimitingTextInputFormatter(5)],
                  ),
                ]),
          ),
          if (bAddressController.text == companyAddressController.text)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                'Uncheck to enter if the billing address is different from the company address',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          const SizedBox(height: 24),
          Text('Primary contact',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            _primateText,
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 24),
          TextFormField(
            enabled: canChange,
            controller: pNameController,
            decoration: InputDecoration(
              labelText: 'Full name',
            ),
            onChanged: (v) {
              if (pnameError != null) {
                setState(() => pnameError = null);
              }
              setState(() => _madeChange = true);
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            enabled: canChange,
            controller: pEmailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email address',
            ),
            onChanged: (v) {
              if (pemailError != null) {
                setState(() => pemailError = null);
              }
              setState(() => _madeChange = true);
            },
          ),
          const SizedBox(height: 16),
          MyPhoneTextField(
            enabled: canChange,
            controller: pphoneMask,
            onChanged: (v) {
              if (pphoneError != null) {
                setState(() => pphoneError = null);
              }
            },
            onSaved: (v) => print(v),
            phoneError: pphoneError,
          ),
          const SizedBox(height: 24),
          Text('Billing contact',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            "We will contact this person when we have questions about financials and billing. This person will also receive emails with invoices, POD, credit limit, and past due notifications.",
            style: TextStyle(fontSize: 12),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: InverseExpansionTile(
              initiallyExpanded: _copyPrimary,
              onExpansionChanged: (v) {
                setState(() {
                  _madeChange = true;
                  _copyPrimary = !_copyPrimary;
                });
              },
              title: Text('Same as the primary contact'),
              children: [
                TextFormField(
                  enabled: canChange,
                  controller: bContactNameController,
                  decoration: InputDecoration(
                    labelText: 'Full name',
                  ),
                  onChanged: (v) {
                    if (bcontactnameError != null) {
                      setState(() {
                        bcontactnameError = null;
                      });
                    }
                    setState(() => _madeChange = true);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  enabled: canChange,
                  controller: bContactEmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email address',
                  ),
                  onChanged: (v) {
                    if (bcontactemailError != null) {
                      setState(() => bcontactemailError = null);
                    }
                    setState(() => _madeChange = true);
                  },
                ),
                const SizedBox(height: 16),
                MyPhoneTextField(
                  enabled: canChange,
                  controller: bphoneMask,
                  onChanged: (v) {
                    if (bcontactphoneError != null) {
                      setState(() => bcontactphoneError = null);
                    }
                  },
                  onSaved: (v) => print(v),
                  phoneError: bcontactphoneError,
                ),
              ],
            ),
          ),
          if (bAddressController.text == companyAddressController.text)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                'Uncheck to enter if the billing contact is different from the primary contact',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          const SizedBox(height: 24),
          if (!widget.me.shipper.verified)
            AnimatedContainer(
              duration: Duration(milliseconds: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_madeChange)
                    Mutation(
                      options: MutationOptions(
                        document: UpdateShipperMutation().document,
                        onCompleted: (dynamic result) {
                          if (result != null) {
                            setState(() {
                              _madeChange = false;
                            });
                            showSnackbar(context, "Saved Successfully", true);
                          }
                        },
                        onError: (e) {
                          print(e);
                          if (e.linkException != null) {
                            showSnackbar(
                                context,
                                "Please check your network and try later",
                                false);
                          }
                        },
                      ),
                      builder: (saveMutation, result) {
                        savingLoading = result.isLoading;
                        bool isTin =
                            widget.me.shipper.tinEinNumber.substring(0, 3) ==
                                "TIN";
                        return Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: double.infinity,
                            child: AbsorbPointer(
                              absorbing: result.isLoading,
                              child: ElevatedButton(
                                onPressed: () => onSubmitTap(saveMutation),
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 14)),
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
                                              fontWeight: FontWeight.w700),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  const SizedBox(width: 8),
                  if (canChange)
                    Mutation(
                        options: MutationOptions(
                            document: ShipperVerifyMutation().document,
                            onCompleted: (dynamic verifyResult) {
                              if (verifyResult != null) {
                                setState(() {
                                  canChange = false;
                                });
                                showSnackbar(
                                  context,
                                  'Please wait for the verification',
                                  true,
                                );
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
                              print(e);
                            }),
                        builder: (verifyMutation, result) {
                          verifyLoading = result.isLoading;
                          return Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: double.infinity,
                              child: AbsorbPointer(
                                absorbing: result.isLoading,
                                child: ElevatedButton(
                                  onPressed: () => onVerifyTap(verifyMutation),
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 14)),
                                  child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 150),
                                    child: result.isLoading
                                        ? Theme(
                                            data: Theme.of(context).copyWith(
                                                accentColor: Colors.white),
                                            child:
                                                const ProgressIndicatorSmall(),
                                          )
                                        : Text(
                                            'Request verification',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                ],
              ),
            ),
          if (!canChange)
            Card(
              color: const Color(0xfff4f7ff),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Text(
                  'If you want to change any information contact with us',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void onSubmitTap(RunMutation runMutation) {
    hideKeyboard();
    if (savingLoading) {
      return;
    }

    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      runMutation(UpdateShipperArguments(
        input: UpdateShipperInput(
          address: ShipperAddressInput(
            address: companyAddressController.text,
            address2: address2Controller.text,
            city: companyCityController.text,
            zipCode: int.tryParse(companyZipController.text) ?? 12345,
            state: savedState,
          ),
          billingAddress: _copyCompany
              ? BillingAddressInput(
                  address: companyAddressController.text,
                  address2: address2Controller.text,
                  city: companyCityController.text,
                  zipCode: int.tryParse(companyZipController.text) ?? 12345,
                  state: savedState,
                )
              : BillingAddressInput(
                  address: bAddressController.text,
                  address2: bAddress2Controller.text,
                  zipCode: int.tryParse(bZCodeController.text) ?? 12345,
                  state: savedState,
                  city: bCityController.text,
                ),
          primaryContact: PrimaryContactInput(
            fullname: pNameController.text,
            email: pEmailController.text,
            phone: getMaskedData(pphoneMask.text),
          ),
          billingContact: _copyPrimary
              ? BillingContactInput(
                  fullname: pNameController.text,
                  email: pEmailController.text,
                  phone: getMaskedData(pphoneMask.text),
                )
              : BillingContactInput(
                  fullname: bContactNameController.text,
                  email: bContactEmailController.text,
                  phone: getMaskedData(bphoneMask.text),
                ),
        ),
      ).toJson());
    }
  }

  void onVerifyTap(RunMutation runMutation) {
    hideKeyboard();
    if (verifyLoading) {
      return;
    }

    runMutation({});
  }
}
