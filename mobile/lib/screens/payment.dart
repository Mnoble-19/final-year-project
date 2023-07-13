import 'package:flutter/material.dart';
import 'package:mobile/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:mobile/utilities/payments.dart';
import 'package:mobile/widgets/custom_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  double credits = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 30, 17, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Buy Credits", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 10),
            Text("Enter Amount", style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 11),
            TextFormField(
              controller: _amountController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                filled: true,
                fillColor: CustomColors.appTransluscentGreenColor,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 11),
            Text("You get", style: Theme.of(context).textTheme.bodySmall),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$credits',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 100,
                          ),
                    ),
                    TextSpan(
                      text: ' credits',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            Text("Enter Mobile Money Number",
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 11),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                filled: true,
                fillColor: CustomColors.appTransluscentGreenColor,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 14),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  CustomColors.appDarkGreenColor,
                ),
              ),
              onPressed: () {
                // TODO: Implement Payment logic
              },
              child: CustomButton(
                label: "Buy Credits",
                onTap: () {
                  collectPayment(credits);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_calculateCredits);
  }

  void _calculateCredits() {
    setState(() {
      String amountText = _amountController.text;
      if (amountText.isNotEmpty) {
        int amount = int.tryParse(amountText) ?? 0;
        credits = amount / 100;
      } else {
        credits = 0;
      }
    });
  }
}
