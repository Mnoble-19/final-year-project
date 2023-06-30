import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/utilities/payments.dart';
import 'package:mobile/widgets/credit_balance_widget.dart';
import 'package:mobile/widgets/custom_button.dart';
import 'package:mobile/widgets/transaction_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CreditBalanceWidget(),
                const SizedBox(
                  height: 10.0,
                ),
                CustomButton(label: "Buy Credits", onTap: (){
                  collectPayment();
                },),
                const SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recent Transactions",
                    style: boldBodyTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text("Transaction" , style: regularBodyTextStyle, textAlign: TextAlign.left,),
                    Text("Balance", style: regularBodyTextStyle, textAlign: TextAlign.right,)
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
               const TransactionWidget(isTopUp: true, amount: 10, balance: 15),
                const TransactionWidget(isTopUp: false, amount: 2, balance: 13),
                const TransactionWidget(isTopUp: false, amount: 2, balance: 11),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
