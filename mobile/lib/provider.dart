import 'package:flutter/material.dart';
import 'package:mobile/widgets/transaction_widget.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeDashboardProvider extends ChangeNotifier {
  String testUserId = 'user0';
  String userName = 'user';
  String availableCredits = "0";
  List<TransactionWidget> transactionsList = [];

  // method to fetch the user's name
  Future<void> fetchUserName(String userId) async {
    try {

      var userSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();
      userName = userSnapshot.get('name');
      notifyListeners();
    } catch (e) {

      print('Error fetching user name: $e');
    }
  }

  // method to fetch available credits
  Future<void> fetchAvailableCredits() async {
    try {
      var userSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(testUserId).get();
      availableCredits = userSnapshot.get('credits').toString();

      notifyListeners(); // Notify listeners that the state has changed
    } catch (e) {
      // Handle any potential errors during fetching data from Firebase
      print('Error updating available credits: $e');
    }
  }

  // method to fetch transactions from firebase
  Future<void> fetchTransactionsFromFirebase() async {
    try {

      var querySnapshot =
      await FirebaseFirestore.instance.collection('transactions').where('user', isEqualTo: testUserId).get();

      transactionsList = querySnapshot.docs.map((doc) {
        return TransactionWidget(
          isTopUp: doc['type'] == 'credit',
          amount: doc['amount'],
          balance: doc['balance'],
        );
      }).toList();

      notifyListeners(); // Notify listeners that the state has changed
    } catch (e) {
      // Handle any potential errors during fetching data from Firebase
      print('Error fetching transactions: $e');
    }
  }
}
