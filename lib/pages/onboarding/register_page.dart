import 'package:flutter/material.dart';
import 'package:project_fab/components/datepicker.dart';
import 'package:project_fab/components/input.dart';
import 'package:project_fab/components/submit_button.dart';
import 'package:project_fab/pages/home_page.dart';
import 'package:project_fab/pages/onboarding/login_page.dart';
import 'package:project_fab/services/authentication_service.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime date = DateTime.now();
  late final TextEditingController _emailController;
  late final TextEditingController _dateOfBirthController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordRepeatController;
  bool isOldEnough = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _dateOfBirthController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordRepeatController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _dateOfBirthController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();

    super.dispose();
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

  Widget _makeDatepicker({label, controller, date, context}) {
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
        makeDatepicker(
          label: 'Date of birth',
          date: date,
          controller: controller,
          context: context,
          onDateTimeChanged: (DateTime newDate) {
            _dateOfBirthController.text =
                '${newDate.day}/${newDate.month}/${newDate.year}';

            setState(() => date = newDate);
          },
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      Text(
                        "Registreren",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Maak een account aan",
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
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        _makeInput(
                          label: "E-mail",
                          controller: _emailController,
                        ),
                        _makeDatepicker(
                          label: 'Date of birth',
                          date: date,
                          controller: _dateOfBirthController,
                          context: context,
                        ),
                        _makeInput(
                            label: "Password",
                            controller: _passwordController,
                            obsureText: true),
                        _makeInput(
                          label: "Confirm Pasword",
                          controller: _passwordRepeatController,
                          obsureText: true,
                        ),
                        // makeCheckbox(
                        //   label: 'I\'m older than 18',
                        //   value: isOldEnough,
                        //   onChanged: (bool? value) {
                        //     setState(() {
                        //       // print(value);
                        //       isOldEnough = value!;
                        //     });
                        //   },
                        // ) //
                      ],
                    ),
                  ),
                  SubmitButton(
                    label: 'Sign up',
                    onPressed: () async {
                      bool isRegistered = await AuthenticationService.register(
                        email: _emailController.text,
                        dateOfBirth: date,
                        password: _passwordController.text,
                      );

                      if (isRegistered) {
                        await AuthenticationService.authenticate(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.popAndPushNamed(
                            context,
                            HomePage.routeName,
                          );
                        });
                      }
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
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            LoginPage.routeName,
                            (_) => false,
                          );
                        },
                        child: const Text(
                          "Already have an account?",
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
