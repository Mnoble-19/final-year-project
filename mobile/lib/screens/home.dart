import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/widgets/customWidgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hello User"),
            SvgPicture.asset(
              'assets/profile.svg',
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                //Stack
                ),
            Center(
              child: Text("Buy Credits"),
            ),
            Container(
              child: Text("Recent transactions"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transaction"),
                Text("Balance"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: BottomNavIcon(
              icon: Icons.home,
              label: 'Home',
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: BottomNavIcon(
              icon: Icons.qr_code,
              label: 'Pay',
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: BottomNavIcon(
              icon: Icons.wallet,
              label: 'Wallet',
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
