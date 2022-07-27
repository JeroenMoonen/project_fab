import 'package:flutter/material.dart';

class AddCheckin extends StatefulWidget {
  static const routeName = '/add-checkin';

  const AddCheckin({Key? key}) : super(key: key);

  @override
  State<AddCheckin> createState() => _AddCheckinState();
}

class _AddCheckinState extends State<AddCheckin> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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
      body: const Text('Add checkin here'),
    );
  }
}
