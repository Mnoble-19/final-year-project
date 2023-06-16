import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_svg/svg.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImageView(
              data: "Uid",
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
