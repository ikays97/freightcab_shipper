import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/widgets/indicators.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInOtpScreen extends StatefulWidget {
  final String phone;

  const SignInOtpScreen(this.phone);

  @override
  _SignInOtpScreenState createState() => _SignInOtpScreenState();
}

class _SignInOtpScreenState extends State<SignInOtpScreen> {
  final formKey = GlobalKey<FormState>();

  bool inProgress = false;

  final otpController = TextEditingController();
  String savedOtp;
  String otpError;

  void onSubmitTap(RunMutation runMutation) {
    hideKeyboard();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      runMutation(SignInArguments(phone: widget.phone, otp: savedOtp).toJson());
    }
  }

  void onAuthSuccess() {
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  String validateOtp(String value) {
    if (value == null || value.isEmpty) {
      //todo value
      return 'Please enter otp';
    }
    return null;
  }

  Widget buildFormBody(BuildContext context) {
    print(widget.phone);
    const totalHorPadding = 20.0 + 16.0;
    String phone = " (${widget.phone.substring(0, 3)})" +
        " ${widget.phone.substring(3, 6)}-${widget.phone.substring(6)} ";
    return Mutation(
      options: MutationOptions(
        document: SignInMutation().document,
        onCompleted: (dynamic resultData) async {
          if (resultData != null) {
            final data = SignIn$Mutation.fromJson(resultData);
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', data.verifyPhone.accessToken);
            onAuthSuccess();
          }
        },
        onError: (e) {
          if (e.linkException != null) {
            showSnackbar(
              context,
              'Something went wrong, please check your network connection and try again.',
              false,
            );
            return;
          }
          final validationError =
              findValidationErrorOrNull(e.graphqlErrors, 'otp');
          if (validationError != null) {
            setState(() => otpError = validationError);
          } else if (e.graphqlErrors.isNotEmpty) {
            setState(() => otpError = e.graphqlErrors[0].message);
            showSnackbar(
              context,
              e.graphqlErrors[0].message ?? 'Something went wrong',
              false,
            );
          } else {
            showSnackbar(
              context,
              'Something went wrong',
              false,
            );
          }
        },
      ),
      builder: (runMutation, result) {
        inProgress = result.isLoading;
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO text
              Text(
                'OTP Verification',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              //TODO text
              SizedBox(
                width:
                    (MediaQuery.of(context).size.width - totalHorPadding * 2.0),
                child: Text(
                    'Fill up the field with the verification code you have received via your phone number.'),
              ),
              const SizedBox(height: 64),
              TextFormField(
                controller: otpController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'OTP',
                  hintText: 'Example: xxxxx',
                  helperText: '',
                  errorText: otpError,
                ),
                onFieldSubmitted: (v) => onSubmitTap(runMutation),
                validator: validateOtp,
                onChanged: (v) {
                  if (otpError != null) {
                    setState(() => otpError = null);
                  }
                },
                onSaved: (v) => savedOtp = v,
              ),
              const SizedBox(height: 4),
              //TODO text
              Text('Otp has been sent to +1$phone phone number'),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: AbsorbPointer(
                  absorbing: result.isLoading,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                    ),
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
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                    ),
                    onPressed: () => onSubmitTap(runMutation),
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: horPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 44.0),
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
}
