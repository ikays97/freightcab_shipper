import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:freightcab_shipper/ui/widgets/text_fields.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'sign_in_otp.dart';
import 'signup.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen();

  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  final _maskedPhoneController = MaskedTextController(mask: '(000) 000-0000');
  String savedPhone;
  String phoneError;

  void onRegisterTap() {
    if (isLoading) {
      return;
    }
    navigateTo(context, (_) => SignUpScreen());
  }

  void onSubmitTap(RunMutation runMutation) {
    hideKeyboard();
    if (isLoading) {
      return;
    }
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        savedPhone = getMaskedData(savedPhone);
      });
      runMutation(SendOtpArguments(phone: savedPhone).toJson());
    }
  }

  void onOtpSent() {
    navigateTo(context, (_) => SignInOtpScreen(savedPhone));
  }

  Widget buildFormBody(BuildContext context) {
    const totalHorPadding = 20.0 + 16.0;
    return Mutation(
      options: MutationOptions(
        document: SendOtpMutation().document,
        onCompleted: (dynamic resultData) {
          if (resultData != null) {
            onOtpSent();
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
          final validationError =
              findValidationErrorOrNull(e.graphqlErrors, 'phone');
          if (validationError != null) {
            setState(() => phoneError = validationError);
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
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: (MediaQuery.of(context).size.width - totalHorPadding),
                child: Text(
                    'Please enter your phone number and submit it in order to get one time password.'),
              ),
              const SizedBox(height: 64),
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
              const SizedBox(height: 48),
              SizedBox(
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
                      duration: const Duration(milliseconds: 150),
                      child: isLoading
                          ? Theme(
                              data: Theme.of(context)
                                  .copyWith(accentColor: Colors.white),
                              child: const ProgressIndicatorSmall(),
                            )
                          : Text(
                              'Send OTP',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: TextButton(
                  onPressed: onRegisterTap,
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: 'First time here?',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText2.color),
                        ),
                        TextSpan(text: '  Create Account '),
                      ],
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: horPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 42),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 44.0,
                ),
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
    _maskedPhoneController.dispose();
  }
}
