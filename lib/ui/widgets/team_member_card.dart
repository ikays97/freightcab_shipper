import 'package:flutter/material.dart';
import 'package:freightcab_shipper/models/graphql/q.graphql_api.dart';
import 'package:freightcab_shipper/ui/shared/extensions.dart';
import 'package:freightcab_shipper/ui/shared/icons.dart';
import 'package:freightcab_shipper/ui/views/edit_team.dart';
import 'package:freightcab_shipper/ui/views/home.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'buttons.dart';

class TeamMemberCard extends StatefulWidget {
  final Me$Query$Me$Shipper$Users driver;
  final String myId;

  const TeamMemberCard({
    Key key,
    @required this.driver,
    @required this.myId,
  }) : super(key: key);
  @override
  _TeamMemberCardState createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<TeamMemberCard> {
  @override
  Widget build(BuildContext context) {
    var myId = widget.myId;
    final id = widget.driver.id;
    final name = widget.driver.firstname;
    final surname = widget.driver.lastname;
    final email = widget.driver.email;
    final phone = widget.driver.phone;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              columnWidths: {
                0: const FixedColumnWidth(60.0 + 20.0),
                1: const FlexColumnWidth(1.0),
              },
              children: [
                TableRow(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: CircleAvatar(
                        radius: 20,
                        child: Text(
                          "${name.substring(0, 1)}${surname.substring(0, 1)}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(5),
                            ),
                            onPressed: () => _buildDialog(widget.driver),
                            child: SvgIcons.edit,
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      if (myId != id)
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                                    return Color(0xffED2626);
                                  },
                                ),
                                padding: MaterialStateProperty.resolveWith<
                                    EdgeInsets>(
                                  (states) {
                                    return EdgeInsets.all(5);
                                  },
                                ),
                              ),
                              onPressed: () => onDeleteTap(id),
                              child: SvgIcons.trash,
                            ),
                          ),
                        ),
                    ],
                  ),
                ]),
                TableRow(children: [
                  Text('Fullname :',
                      style: TextStyle(
                          color: Color(0xff9BA9C6),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text("$name $surname",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ),
                ]),
                TableRow(children: [
                  Text('Email :',
                      style: TextStyle(
                          color: Color(0xff9BA9C6),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(email,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ),
                ]),
                TableRow(children: [
                  Text('Phone:',
                      style: TextStyle(
                          color: Color(0xff9BA9C6),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(phone,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  onDeleteTap(String shipperId) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: DriverDeleteWidget(
            shipperId: shipperId,
          ),
        );
      },
    );
  }

  _buildDialog(Me$Query$Me$Shipper$Users shipper) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: EditTeamMember(
            shipper: shipper,
          ),
        );
      },
    );
  }
}

class DriverDeleteWidget extends StatefulWidget {
  final String shipperId;

  const DriverDeleteWidget({Key key, @required this.shipperId})
      : super(key: key);

  @override
  _DriverDeleteWidgetState createState() => _DriverDeleteWidgetState();
}

class _DriverDeleteWidgetState extends State<DriverDeleteWidget> {
  bool isLoading = false;
  String userIdError;
  String deleteError;

  onDeleted() {
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
        document: DeleteShipperMutation().document,
        onCompleted: (dynamic resultData) {
          if (resultData != null) {
            Navigator.pop(context);
            onDeleted();
            showSnackbar(context, 'Driver has been deleted successfully', true);
          }
        },
        onError: (e) {
          Navigator.pop(context);
          // link exception
          if (e.linkException != null) {
            showSnackbar(
                context,
                'Something went wrong, please check your network connection and try again.',
                false);
            return;
          }

          final validationErrors =
              findValidationErrors(e.graphqlErrors, ['user_id']);

          if (validationErrors.isNotEmpty) {
            setState(() {
              userIdError = validationErrors['user_id'];
            });
            showSnackbar(context, 'Please check entered fields', false);
          } else if (e.graphqlErrors.isNotEmpty) {
            debugPrint(e.graphqlErrors.toString(), wrapWidth: 1024);
            showSnackbar(context,
                e.graphqlErrors[0].message ?? 'Something went wrong', false);
          } else {
            showSnackbar(context, 'Something went wrong', false);
          }
        },
      ),
      builder: (runMutation, result) {
        isLoading = result.isLoading;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Attention!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Do you really want to delete this team member?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedWhiteButton(
                      title: 'No',
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: isLoading,
                      child: ElevatedPrimaryButton(
                        title: 'Yes',
                        onPressed: () {
                          runMutation(
                              DeleteShipperArguments(id: widget.shipperId)
                                  .toJson());
                        },
                        isLoading: isLoading,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
