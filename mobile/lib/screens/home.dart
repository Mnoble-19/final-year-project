import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/provider.dart';
import 'package:mobile/screens/QRcode_screen.dart';
import 'package:mobile/screens/home_tab.dart';
import 'package:mobile/screens/login_screen.dart';
import 'package:mobile/screens/payment.dart';

import 'package:mobile/widgets/customWidgets.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  String? name;
  final List<Widget> _screens = [
    HomeTab(),
    QRCodeScreen(),
    PaymentScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Consumer<HomeDashboardProvider>(
          builder: (context, homeDashboardProvider, child) {
            return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hello, ${homeDashboardProvider.userName}", style: Theme.of(context).textTheme.bodyMedium),
            PopupMenuButton<String>(
              icon: SvgPicture.asset('assets/profile.svg'),
              onSelected: (value) {
                if (value == 'Profile') {
                } else if (value == 'Logout') {
                  _logout();
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'Profile',
                  child: Text('Profile'),
                ),
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text('Logout'),
                ),
              ],
            ),
          ],
        );
          }),
      ),
      
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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

  @override
  void initState() {
    super.initState();
    updateName();
  }

  Future<void> updateName() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    String name = '';
    try {
      String uid = _auth.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      name = documentSnapshot.data()!['name'];
    } catch (e) {
      print('Error during getName: $e');
    }
    if (name == '') {
      name = 'User';
    }
    setState(() {
      this.name = name;
    });
    return;
  }

  Future<void> _logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false,
      );
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}
