import 'package:flutter/material.dart';
import 'package:project_fab/components/input.dart';
import 'package:project_fab/components/submit_button.dart';
import 'package:project_fab/localization/localization.dart';
import 'package:project_fab/pages/home_page.dart';
import 'package:project_fab/pages/onboarding/forgot_password_page.dart';
import 'package:project_fab/pages/onboarding/register_page.dart';
import 'package:project_fab/services/authentication_service.dart';
import 'package:project_fab/services/user_service.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future onLoginPressed({required context}) async {
    try {
      final auth = await AuthenticationService.authenticate(
        email: _emailController.text,
        password: _passwordController.text,
      );
      await UserService.getUser(
        id: auth.userId,
        fromLocal: false,
        saveToLocal: true,
        isMe: true,
      );

      Navigator.pushNamedAndRemoveUntil(
        context,
        HomePage.routeName,
        (_) => false,
      );
    } catch (e) {
      var snackBar = SnackBar(
        content: Text(e.toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget _makeInput({label, controller, obsureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        makeInput(
          label: label,
          controller: controller,
          obsureText: obsureText,
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welcome back!",
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
                        _makeInput(
                          label: "E-mail",
                          controller: _emailController,
                        ),
                        _makeInput(
                          label: "Password",
                          obsureText: true,
                          controller: _passwordController,
                        ),
                      ],
                    ),
                  ),
                  SubmitButton(
                    label: Localization.of(context).login,
                    onPressed: () {
                      onLoginPressed(context: context);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RegisterPage.routeName,
                          );
                        },
                        child: const Text(
                          "Dont have an account yet?",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            ForgotPasswordPage.routeName,
                          );
                        },
                        child: const Text(
                          "Forgot password",
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
      ),
    );
  }
}
