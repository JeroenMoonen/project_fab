import 'package:flutter/material.dart';
import 'package:project_fab/components/input.dart';
import 'package:project_fab/components/submit_button.dart';
import 'package:project_fab/localization/localization.dart';

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
                  children: <Widget>[
                    Text(
                      Localization.of(context).forgotPasswordTitle,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      Localization.of(context).forgotPasswordSubtitle,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
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
                        label: Localization.of(context).forgotPasswordEmail,
                        controller: _emailController,
                      ),
                    ],
                  ),
                ),
                SubmitButton(
                  label: Localization.of(context).forgotPasswordSubmit,
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
                      child: Text(
                        Localization.of(context).forgotPasswordIDoRemember,
                        style: const TextStyle(
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
