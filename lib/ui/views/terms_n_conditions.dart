import 'package:flutter/material.dart';

//TODO text
const _TermsOfUse =
    '''These Terms of Use (“Terms”) govern the access or use by you, an individual or entity, from within the United States and Canada of the applications (including mobile applications), websites, content, products, and services (collectively, the “Services”) made available in the United States and Canada by Uber Freight LLC and its subsidiaries and affiliates (collectively, “Uber Freight”). PLEASE READ THESE TERMS CAREFULLY BEFORE ACCESSING AND USING THE SERVICES. In these Terms, the words “including” and “include” mean “including, but not limited to.”

Your access and use of the Services constitutes your agreement to be bound by these Terms, which establishes a contractual relationship between you and Uber Freight. If you do not agree to these Terms, you may not access or use the Services. These Terms expressly supersede and replace any prior agreements or arrangements between you or any shipper or motor carrier you represent, on the one hand, and Uber Freight, on the other hand, with respect to the subject matter of these Terms, except that with respect to any shipper or motor carrier agreement between the shipper or carrier you represent (as applicable) and Uber Freight, such agreement shall not be superseded or replaced by these Terms, and to the extent that such other agreement is inconsistent with these Terms, such other agreement will govern. Uber Freight may, at any time for any reason, without notice to you, cease offering you access to the Services or any portion thereof or deny you access to the Services or any portion thereof.

Supplemental terms may apply to certain Services, such as policies for a particular event, program, activity or promotion, and such supplemental terms will be disclosed to you in separate disclosures (e.g., a particular promotional webpage) or in connection with the applicable Service(s). Supplemental terms are in addition to, and shall be deemed a part of, these Terms for the purposes of the applicable Service(s). Supplemental terms shall prevail over these Terms in the event of a conflict with respect to the applicable Services.

Uber Freight may amend these Terms from time to time. Amendments will be effective upon Uber Freight’s posting of such updated Terms at this location. Your continued access or use of the Services after such posting constitutes your consent to be bound by the Terms, as amended.

Our collection and use of personal information in connection with the Services is as provided in Uber Freight’s Privacy Notice located at https://www.uberfreight.com/privacy-policy.''';

class TermsAndConditionsScreen extends StatelessWidget {
  Widget buildAppBar(
      BuildContext context, BoxConstraints constraints, Widget titleWidget) {
    final FlexibleSpaceBarSettings settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final double deltaExtent = settings.maxExtent - settings.minExtent;

    // 0.0 -> Expanded
    // 1.0 -> Collapsed to toolbar
    final double t =
        (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
            .clamp(0.0, 1.0);

    final ThemeData theme = Theme.of(context);

    Widget /*?*/ title;
    switch (theme.platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        title = titleWidget;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        title = Semantics(
          namesRoute: true,
          child: titleWidget,
        );
        break;
    }

    TextStyle titleStyle = theme.textTheme.headline6
        .copyWith(fontSize: 16, fontWeight: FontWeight.bold);
    final double padValue = Tween<double>(begin: 24.0, end: 64.0).transform(t);
    final EdgeInsetsGeometry padding =
        EdgeInsetsDirectional.only(start: padValue, bottom: 16.0);
    final double scaleValue = Tween<double>(begin: 1.5, end: 1.0).transform(t);
    final Matrix4 scaleTransform = Matrix4.identity()
      ..scale(scaleValue, scaleValue, 1.0);
    final Alignment titleAlignment = Alignment.bottomLeft;
    return Container(
      padding: padding,
      child: Transform(
        alignment: titleAlignment,
        transform: scaleTransform,
        child: Align(
          alignment: titleAlignment,
          child: DefaultTextStyle(
            style: titleStyle,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                width: constraints.maxWidth / scaleValue,
                alignment: titleAlignment,
                child: title,
              );
            }),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).canvasColor,
              expandedHeight: 108,
              pinned: true,
              leading: GestureDetector(
                  child: Icon(Icons.arrow_back, color: Colors.black),
                  onTap: () => Navigator.of(context).pop()),
              flexibleSpace: LayoutBuilder(
                builder: (ctx, constraints) =>
                    buildAppBar(ctx, constraints, Text('Terms&Conditions')),
              ),
            ),
            SliverToBoxAdapter(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(24, 12, 24, 56),
                child: _TermsAndConditionsBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const Padding(
        padding: EdgeInsets.fromLTRB(24, 12, 24, 56),
        child: _TermsAndConditionsBody(),
      ),
    );
  }
}

class _TermsAndConditionsBody extends StatelessWidget {
  const _TermsAndConditionsBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Soluchain Freight Terms of Use',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Contractual Relationships',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(_TermsOfUse),
        ],
      ),
    );
  }
}
