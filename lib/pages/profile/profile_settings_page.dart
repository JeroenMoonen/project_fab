import 'package:flutter/material.dart';
import 'package:project_fab/components/input.dart';
import 'package:project_fab/localization/localization.dart';

import 'package:project_fab/services/user_service.dart';

class ProfileSettingsPage extends StatefulWidget {
  static const routeName = '/profile/settings';
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _aboutController;
  late TextEditingController _emailController;
  late TextEditingController _locationController;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _aboutController = TextEditingController();
    _locationController = TextEditingController();

    _fetchMe();

    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _aboutController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  _fetchMe() async {
    final user = await UserService.getMe();

    setState(() {
      _firstNameController.text = user.firstName!;
      _lastNameController.text = user.lastName!;
      _aboutController.text = user.about!;
      _emailController.text = user.email;
      if (user.location == null) {
        // _locationController.text = user.location!;
      }
    });
  }

  Widget _makeInput({label, controller}) {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            _makeInput(
              label: Localization.of(context).profileSettingsFirstname,
              controller: _firstNameController,
            ),
            _makeInput(
              label: Localization.of(context).profileSettingsLastname,
              controller: _lastNameController,
            ),
            _makeInput(
              label: Localization.of(context).profileSettingsLocation,
              controller: _locationController,
            ),
            _makeInput(
              label: Localization.of(context).profileSettingsAbout,
              controller: _aboutController,
            ),
          ],
        ),
      ),
    );
  }
}
