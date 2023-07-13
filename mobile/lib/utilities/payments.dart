import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> collectPayment(double credits) async {
  print("going to collect payment");
  String apiKey = '4kzD9WMh283536e722f89ce0d4eeeb81db86cd39';
  String url = 'https://silicon-pay.com/process_payments';

  Map<String, dynamic> dataReq = {
    "req": "mobile_money",
    "currency": "UGX",
    "phone": "+256781564218",
    "encryption_key": apiKey,
    "amount": "10000",
    "emailAddress": "wanderaemmabryan@gmail.com",
    'call_back': " https://290d-105-21-80-26.in.ngrok.io",
    "txRef": "ETOLLSXX1"
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(dataReq),
  );

  if (response.statusCode == 200) {
    // Payment request successful, handle the response here
    print(response.body);

    addCredits(credits);
  } else {
    // Payment request failed, handle the error here
    print('Payment request failed: ${response.statusCode}');
  }
}

Future<void> addCredits(double creditsToAdd) async {
  final user = FirebaseAuth.instance.currentUser;
  final userRef = FirebaseFirestore.instance.collection('users').doc(user!.uid);

  await FirebaseFirestore.instance.runTransaction((transaction) async {
    final snapshot = await transaction.get(userRef);
    final currentCredits = snapshot.data()?['credits'] ?? 0;

    final newCredits = currentCredits + creditsToAdd;

    transaction.update(userRef, {'credits': newCredits});
  });

  print("credits added");
}

Future<double> getAvailableCredits() async {
  final user = FirebaseAuth.instance.currentUser;
  final userRef = FirebaseFirestore.instance.collection('users').doc(user!.uid);

  final snapshot = await userRef.get();
  final currentCredits = snapshot.data()?['credits'] ?? 0;

  return currentCredits;
}