import 'package:bynry_assignment/Screens/tab_screen.dart';
import 'package:bynry_assignment/Wigets/common_textbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool isLoading = false;

  signInWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passController.text);

      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = true;
      });
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).clearSnackBars();

        print('User not found or wrong password');
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 75, 75, 238),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WELCOME BACK!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                        )),
                const SizedBox(
                  height: 20,
                ),
                Text('Log into your account',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        )),
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
          Container(
            height: 400,
            margin: const EdgeInsets.only(top: 250),
            child: Positioned(
              top: 500,
              bottom: 40,
              child: Container(
                width: width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 225, 225, 228),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            top: 225,
            child: Container(
              width: width,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: CommonTextBox(
                            controller: _emailController,
                            hintText: 'Enter the Email ID'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: CommonTextBox(
                            controller: _passController, hintText: 'Password'),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 114, 23, 189),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (_emailController.text.isNotEmpty &&
                              _passController.text.isNotEmpty) {
                            signInWithEmailAndPassword();
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 242, 91, 31)),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 242, 91, 31),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                'LOGIN',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 540,
            left: 60,
            child: Row(
              children: [
                const Text(
                  'Don\'t have an Account? ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 137, 137, 140),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('not developed')));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color.fromARGB(255, 114, 23, 189),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
