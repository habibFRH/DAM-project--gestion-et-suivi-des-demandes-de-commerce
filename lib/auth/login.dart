// login_page.dart

// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import '../components/customButtonAuth.dart';
import '../components/customLogoAuth.dart';
import '../components/textFormField.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  Future<void> _signIn(BuildContext context) async {
    try {
      await _authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print('Login failed. Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Check your credentials.'),
        ),
      );
    }
  }

  void _goToSignUp(BuildContext context) {
    Navigator.pushNamed(context, '/sign_up');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(92, 94, 23, 235), Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.topCenter,
          ),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomLogoAuth(height: 150, width: 300),
                const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 30,
                ),
                CustomTextForm(
                  obscureText: false,
                  label: "Email",
                  hinttext: 'Enter Your Email',
                  mycontroller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                Container(
                  height: 20,
                ),
                CustomTextForm(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  label: "Password",
                  hinttext: 'Enter Your Password',
                  mycontroller: passwordController,
                ),
                // Container(
                //   alignment: Alignment.topRight,
                //   margin: const EdgeInsets.only(top: 10, bottom: 20),
                //   child: const Text(
                //     "Forgot Password",
                //     textAlign: TextAlign.right,
                //     style: TextStyle(fontSize: 14),
                //   ),
                // ),
              ],
            ),
            CustomButtonAuth(
              title: "Login",
              onPressed: () => _signIn(context),
            ),
            Container(
              height: 10,
            ),
            // MaterialButton(
            //   height: 40,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   onPressed: () {},
            //   color: const Color.fromARGB(255, 18, 194, 135),
            //   child: const Text(
            //     "Login with Google",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            Container(
              height: 20,
            ),
            InkWell(
              onTap: () => _goToSignUp(context),
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "don't have an account ? "),
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                          color: Color(0xff5E17EB),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
