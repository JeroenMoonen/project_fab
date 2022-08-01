import 'package:flutter/material.dart';
import 'package:project_fab/components/input.dart';
import 'package:project_fab/components/submit_button.dart';

import 'package:project_fab/pages/onboarding/login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = '/forgot-password';
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  Future onResetPressed({required context}) async {
    var snackBar = const SnackBar(
      content: Text('TODO!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // Navigator.pushReplacementNamed(
    //   context,
    //   HomePage.routeName,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        // height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Column(
                  children: const <Widget>[
                    Text(
                      "Forgot password",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "No problem, we got you.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Column(
                    children: [
                      makeInput(
                        label: "E-mail",
                        controller: _emailController,
                      ),
                    ],
                  ),
                ),
                SubmitButton(
                  label: 'Send me a reset link',
                  onPressed: () => {onResetPressed(context: context)},
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginPage.routeName,
                          (_) => false,
                        );
                      },
                      child: const Text(
                        "Nevermind, I remember now!",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
