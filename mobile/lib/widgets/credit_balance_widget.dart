import 'package:flutter/material.dart';
import 'package:mobile/constants/constants.dart';

class CreditBalanceWidget extends StatelessWidget {
  String availabeCredits;

  CreditBalanceWidget({
    super.key,
    required this.availabeCredits
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        color: CustomColors.appLightGreenColor, // #DEEEE3
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(availabeCredits, style: largeTextStyle, textAlign: TextAlign.left,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Available credits", style: mediumBodyTextStyle, textAlign: TextAlign.left,),
          )
        ],
      ),
    );
  }
}
