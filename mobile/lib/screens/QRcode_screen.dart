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
  String? uid;

  @override
  void initState() {
    super.initState();
    getUserUID();
  }

  Future<void> getUserUID() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      setState(() {
        uid = user.uid;
      });
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
              data: uid ?? '',
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
