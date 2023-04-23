import 'package:flutter/material.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/screens/signup_screen.dart';
import 'package:mobile/widgets/customWidgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.appLightGreenColor,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 17, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 359,
              height: 265,
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
                padding: EdgeInsets.fromLTRB(17, 0, 0, 18),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: CustomColors.appDarkGreenColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Welcome to",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 24,
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
                      // const SizedBox(height: 16.0),
                      Text(
                        "Drive smart, go digital!",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                            ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 41.0),
            const Align(
              heightFactor: 0.5,
              alignment: Alignment.topLeft,
              child: Text(
                'LOGIN',
              ),
            ),
            const SizedBox(height: 24.0),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Email Address',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            const SizedBox(height: 19.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: CustomColors.appTransluscentGreenColor,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Password',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            const SizedBox(height: 19.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: CustomColors.appTransluscentGreenColor,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  CustomColors.appDarkGreenColor,
                ),
              ),
              onPressed: () {
                // TODO: Implement login logic
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(91, 18, 91, 17),
                  child: Text('Login'),
                ),
              ),
            ),
            const SizedBox(height: 11.0),
            Flexible(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}