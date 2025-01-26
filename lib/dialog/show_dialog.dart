import 'package:flutter/material.dart';

class CityDialog extends StatefulWidget {
  const CityDialog({super.key});

  @override
  _CityDialogState createState() => _CityDialogState();
}

class _CityDialogState extends State<CityDialog> {
  late final TextEditingController _cityController;
  @override
  initState() {
    super.initState();
    _cityController = TextEditingController();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Today\'s Weather'),
      content: TextField(
        controller: _cityController,
        decoration: const InputDecoration(
          hintText: 'Enter your city name',
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
