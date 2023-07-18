import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/provider.dart';
import 'package:mobile/utilities/payments.dart';
import 'package:mobile/widgets/credit_balance_widget.dart';
import 'package:mobile/widgets/custom_button.dart';
import 'package:mobile/widgets/transaction_widget.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

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
          child: Consumer<HomeDashboardProvider>(
              builder: (context, homeDashboardProvider, child) {
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(homeDashboardProvider.userId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Loading indicator while waiting for data
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                final availableCredits = snapshot.data?.get('credits')?.toString() ?? '0';

                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('transactions')
                      .where('user', isEqualTo: homeDashboardProvider.userId)
                      .snapshots(),
                  builder: (context, transactionsSnapshot) {
                    if (transactionsSnapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Loading indicator while waiting for data
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
            )
            ;
          }),
        ),
      ),
    ));
  }
}
