import 'package:flutter/material.dart';

class FaqItem {
  final String question;
  final String answer;

  const FaqItem({
    @required this.question,
    @required this.answer,
  });
}

//TODO FAQ items
final _FaqItems = [
  FaqItem(
    question: "Can I update my profile name and email address?",
    answer:
        "Yes. In order to update your shipper profile settings, navigate to and click on your name at inside Team section on the sidebar, then click edit icon. From here you can update your shipper name, surname, and email.",
  ),
  FaqItem(
      question: "What services do you offer to shippers?",
      answer:
          "We provide full truckload service with either dry van or refrigerated (reefer) equipment. We currently service the continental U.S. with cross-border support to Canada. We don’t support pickups or deliveries at farms or ports, or service hazmat shipments."),
  FaqItem(
      question: "I’m locked out of my account, how do I unlock my login?",
      answer:
          "In order to protect your privacy, we temporarily lock accounts after several unsuccessful login attempts. If you find yourself locked out of your account, no worries! You will be able to retry login after 30 minutes."),
  FaqItem(
      question: "What happens after I click 'Book Shipment'?",
      answer:
          "When you click Book Shipment Freightcab immediately gets to work finding a carrier for your shipment. We offer the shipment to our network of tens of thousands of high-quality carriers via the Freightcab app and portal, where they can accept the load, view all shipment details and upload paperwork. We guarantee coverage at the rate you booked and will never come back and ask for more money or give back a spot or backup shipment Freightcab monitors all shipments via our real-time GPS tracking. We automatically update a shipment’s status as soon as the driver arrives or departs both pickup and delivery, and you can track that via the Google Map. You will also receive automatic email alerts when the driver arrives at pickup, departs pickup, arrives at delivery and completes delivery right to your inbox. When a shipment isn’t moving as quickly as we’d expect, our teams are automatically alerted to check in and resolve the issue. We also use GPS tracking to estimate the time of arrival, and instantly alert shippers within the shipper platform if a drivers ETA slips from on-time to late. In short, Freighcab has you covered! Once you click 'Book Shipment' your work is done and Freighcab takes the lead on ensuring that your shipment is serviced on-time and at cost."),
  FaqItem(
      question: "How do you vet carriers in your network?",
      answer:
          "Freighcab holds carriers in our network to the industry’s highest standards in order to provide shippers with higher tender acceptance, better on-time performance, and fewer safety incidents. Our compliance team and machine learning models continuously evaluate carriers with input from both industry regulators and customers to build one of the industry’s safest, most reliable truckload networks."),
  FaqItem(
      question:
          "Will Freightcab let me know where my shipment is after it’s left my facility?",
      answer:
          "Yes. We offer 24/7 visibility through live GPS tracking on your shipments, enabling tracking from the point where a load is accepted by one of our carriers to when it’s dropped off at its destination. We’ll also notify you for major shipment progress milestones (accepted, in-progress, dispatched, at pickup, in transit, at delivery, delivered)."),
  FaqItem(
      question: "How do I verify my account?",
      answer:
          "Upon sign-in, to protect your privacy, you will receive an email to confirm your email address. If you would like Convoy to resend this email, log into the Convoy shipper platform and click the link in the banner to resend the verification email. Make sure to check your inbox and spam folder."),
  FaqItem(
      question: "How do I add a new user to my account?",
      answer:
          "Shippers can add a new user to their account by pressing add user button and filling out the forms correctly inside the Team section."),
  FaqItem(
      question:
          "Why can't I see the driver's movement for a specific shipment?",
      answer:
          "The majority of Convoy shipments have GPS tracking enabled. If you do not see tracking enabled for your shipment, email support@freightcab.com."),
  FaqItem(
      question: "How do I cancel a shipment?",
      answer:
          "Shippers can cancel a shipment through the shipment details page, by clicking Reject shipment button in the bottom right corner, and selecting yes on verification modal. If a shipment is cancelled within 4 hours of pickup, this shipment may be subject to a truck order not used (TONU) and charges on the behalf of carrier. If you have trouble cancelling email support@freightcab.com for help."),
  FaqItem(
      question: "Are you currently servicing Canada or Mexico?",
      answer:
          "Freight specializes in continental US freight and does not currently service freight into or out of Canada or Mexico through this shipper platform."),
  FaqItem(
      question:
          "What happens if there is a shortage, overage or damage to my shipment?",
      answer:
          "Shippers can resolve shipment OS&D issues by emailing shipperdirectsupport@convoy.com."),
  FaqItem(
      question: "How long should I expect to wait for invoices?",
      answer:
          "Freightcab will send invoices within 7 days of a shipment’s completion. This is subject to carriers uploading POD, so there may be occasional outliers."),
  FaqItem(
      question: "Can I view my invoices?",
      answer:
          "Shippers can request an early copy of an invoice by emailing support@freightcab.com. Please allow 3 business days after shipment completion before requesting a copy. Bill of lading, Proof of delivery, and invoice will be ready in that time in past shipments section inside.")
];

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Frequently Asked Questions',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ExpansionPanelList.radio(
              initialOpenPanelValue: 0,
              elevation: 0,
              children: List.generate(_FaqItems.length, (index) {
                final item = _FaqItems[index];
                return ExpansionPanelRadio(
                  value: index,
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded) => Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.question,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(item.answer),
                  ),
                );
              }).toList(growable: false),
            ),
          ),
          const SizedBox(height: 26),
        ],
      ),
    );
  }
}
