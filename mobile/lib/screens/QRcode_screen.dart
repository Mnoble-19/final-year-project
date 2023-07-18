import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  String qrData = '';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      String uid = '';
      bool isStudent = false;
      FirebaseAuth auth = FirebaseAuth.instance;
      final user = auth.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            uid = user.uid;
            isStudent = (documentSnapshot.data()
                    as Map<String, dynamic>)['isStudent'] ??
                false;
          }
        });
      }
      final data = {'uid': uid, 'isStudent': isStudent};
      final jsonData = jsonEncode(data);
      setState(() {
        qrData = jsonData;
      });
    } catch (err) {
      print("Error in QrCode Screen $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImageView(
              data: qrData,
              size: 300,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text("Scan at toll gate"),
            const SizedBox(
              height: 22.33,
            ),
            SvgPicture.asset(
              'assets/etolls.svg',
            ),
          ],
        ),
      ),
    );
  }
}
