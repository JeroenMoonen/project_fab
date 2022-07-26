import 'package:flutter/material.dart';
import 'package:project_fab/components/input.dart';
import 'package:project_fab/services/authentication_service.dart';
import 'package:project_fab/services/user_service.dart';

class LoginPage extends StatefulWidget {
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
        saveToLocal: true,
      );

      Navigator.pushNamedAndRemoveUntil(
        context,
        '/feed',
        (_) => false,
      );
    } catch (e) {
      var snackBar = SnackBar(
        content: Text(e.toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
                      makeInput(
                        label: "E-mail",
                        controller: _emailController,
                      ),
                      makeInput(
                        label: "Password",
                        obsureText: true,
                        controller: _passwordController,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 3,
                      left: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: const Border(
                        bottom: BorderSide(
                          color: Colors.black,
                        ),
                        top: BorderSide(
                          color: Colors.black,
                        ),
                        right: BorderSide(
                          color: Colors.black,
                        ),
                        left: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        onLoginPressed(context: context);
                      },
                      color: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
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
                          '/register',
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
                          '/forgot-password',
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
    );
  }
}
