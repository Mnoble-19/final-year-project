import 'package:flutter/material.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/constants/constants.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 67, 17, 0),
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
                      text: '0',
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
              child: Container(
                width: 357,
                height: 65,
                margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Center(
                  child: Text(
                    'Buy Credits',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
