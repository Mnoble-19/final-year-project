import 'package:flutter/material.dart';

import 'package:Etolls/constants/constants.dart'; // Update this line
import 'package:Etolls/screens/login_screen.dart'; // Update this line
import 'package:Etolls/services/authService.dart'; // Update this line
import 'package:Etolls/screens/home.dart'; // Update this line
import 'package:Etolls/widgets/customWidgets.dart'; // Update this line


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.appLightGreenColor,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 20, 17, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.22,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(0),
                    color: CustomColors.appDarkGreenColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(17, 0, 0, 18),
                    child: Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.22,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(0),
                        color: CustomColors.appDarkGreenColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Welcome to",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'E',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 60,
                                      ),
                                ),
                                TextSpan(
                                  text: '-tolls',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 60,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Drive smart, go digital!",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
),
                  ),
                ),
                const SizedBox(height: 11.0),
                const Align(
                  heightFactor: 0.5,
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign up',
                  ),
                ),
                const SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email Address',
                    style: Theme.of(context).textTheme.bodySmall!,
                  ),
                ),
                const SizedBox(height: 19.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CustomColors.appTransluscentGreenColor,
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email address';
                    }
                    final emailRegex =
                        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'First Name',
                    style: Theme.of(context).textTheme.bodySmall!,
                  ),
                ),
                const SizedBox(height: 19.0),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CustomColors.appTransluscentGreenColor,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Password',
                    style: Theme.of(context).textTheme.bodySmall!,
                  ),
                ),
                const SizedBox(height: 19.0),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Password!';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CustomColors.appTransluscentGreenColor,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      CustomColors.appDarkGreenColor,
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      String name = _nameController.text;

                      bool signedUp = await signup(email, name, password);
                      if (signedUp) {
                        Navigator.of(context).pushReplacement(CustomPageRoute(
                            builder: (context) => const MyHomePage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Sign up failed!'),
                          ),
                        );
                      }
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(80, 18, 80, 17),
                      child: Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 11.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
