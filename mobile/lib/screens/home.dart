import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/provider.dart';
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
  final List<Widget> _screens = [
    HomeTab(),
    Placeholder(),
    PaymentScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<HomeDashboardProvider>(
          builder: (context, homeDashboardProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello ${homeDashboardProvider.userName}"),
                SvgPicture.asset(
                  'assets/profile.svg',
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
}
