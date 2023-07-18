import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:Etolls/constants/constants.dart'; // Update this line
import 'package:Etolls/provider.dart'; // Update this line
import 'package:Etolls/utilities/payments.dart'; // Update this line
import 'package:Etolls/widgets/credit_balance_widget.dart'; // Update this line
import 'package:Etolls/widgets/custom_button.dart'; // Update this line
import 'package:Etolls/widgets/transaction_widget.dart'; // Update this line
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final userId = user?.uid;

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print("waiting");
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  final availableCredits =
                      snapshot.data?.get('credits')?.toString() ?? '0';

                  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('transactions')
                        .where('user', isEqualTo: userId)
                        .snapshots(),
                    builder: (context, transactionsSnapshot) {
                      if (transactionsSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      if (transactionsSnapshot.hasError) {
                        return Text('Error: ${transactionsSnapshot.error}');
                      }

                      // Check if data is not null before accessing it
                      final transactionDocs = transactionsSnapshot.data?.docs ?? [];

                      // Convert the documents in the query snapshot to TransactionWidget objects
                      List<TransactionWidget> transactionsList = transactionDocs.map((doc) {
                        final isTopUp = doc['type'] == 'credit';
                        final amount = doc['amount'] ?? 0;
                        final balance = doc['balance'] ?? 0;

                        return TransactionWidget(
                          isTopUp: isTopUp,
                          amount: amount,
                          balance: balance,
                        );
                      }).toList();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CreditBalanceWidget(
                            availabeCredits: availableCredits,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CustomButton(
                            label: "Buy Credits",
                            onTap: () {
                              collectPayment();
                            },
                          ),
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
                            children: [
                              Text(
                                "Transaction",
                                style: regularBodyTextStyle,
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Balance",
                                style: regularBodyTextStyle,
                                textAlign: TextAlign.right,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ...transactionsList
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          )
          ,
        ));
  }
}