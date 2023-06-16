import 'package:flutter/material.dart';
import 'package:mobile/constants/constants.dart';

class TransactionWidget extends StatelessWidget {
  final bool isTopUp;
  final int amount;
  final int balance;

  const TransactionWidget({
    super.key,
    required this.isTopUp,
    required this.amount,
    required this.balance
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              isTopUp ? Image.asset("assets/images/green-transaction-icon.png") : Image.asset("assets/images/red-transaction-icon.png"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(isTopUp ? "Top Up" : "Makerere University",
                      style: TextStyle(
                        color: isTopUp? const Color(0xff278A45).withOpacity(1) : const Color(0xffC14040).withOpacity(0.84),
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,

                      ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(amount.toString() , style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,

                      ),),
                      const SizedBox(
                        width: 2.5,
                      ),
                      Text("credits",

                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),

                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,

                        ),)
                    ],
                  ),

                ],
              )
            ],
          ),
          Text(balance.toString(), style: TextStyle(
            color: Colors.black.withOpacity(1),
            fontWeight: FontWeight.w600,
            fontSize: 20.0,

          ),)
        ],
      ),
    );
  }
}
