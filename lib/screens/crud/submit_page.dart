import 'package:ebooks/screens/crud/text_submit_form.dart';
import 'package:flutter/material.dart';

class SubmitPage extends StatelessWidget {
  const SubmitPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: TextSubmitForm(onSubmit: (value) => print(value)),
        ),
      ),
    );
  }
}
