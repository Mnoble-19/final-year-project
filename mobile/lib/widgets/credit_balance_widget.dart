import 'package:flutter/material.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/utilities/payments.dart';

class CreditBalanceWidget extends StatefulWidget {
  const CreditBalanceWidget({Key? key}) : super(key: key);

  @override
  _CreditBalanceWidgetState createState() => _CreditBalanceWidgetState();
}

class _CreditBalanceWidgetState extends State<CreditBalanceWidget> {
  double availableCredits = 0;

  @override
  void initState() {
    super.initState();
    _fetchAvailableCredits();
  }

  Future<void> _fetchAvailableCredits() async {
    try {
      final currentCredits = await getAvailableCredits();

      setState(() {
        availableCredits = currentCredits.toDouble();
      });
    } catch (e) {
      print('Error fetching available credits: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        color: CustomColors.appLightGreenColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            availableCredits.toString(),
            style: largeTextStyle,
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Available credits",
              style: mediumBodyTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
