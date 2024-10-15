import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/validate_operations.dart';

class UrlPage extends StatefulWidget {
  const UrlPage({super.key});

  @override
  State<UrlPage> createState() => _UrlPageState();
}

class _UrlPageState extends State<UrlPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _urlController =
      TextEditingController(text: "https://demoapi.orienseam.com/api");
  bool get validate => _formKey.currentState?.validate() ?? false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Enter a URL'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _urlController,
                  decoration: const InputDecoration(
                    labelText: StringConstants.urlTitle,
                    prefixIcon: Icon(Icons.link),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.url,
                  validator: (value) =>
                      ValidateOperations.normalValidation(value),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _sendURLLink,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Change navigation by S
  Future<void> _sendURLLink() async {
    if (validate) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('base_url', _urlController.text);

      // SharedPreferenceUtils.setString(
      //     "eamAPIBaseURL", (_urlController.value.text ?? ""));
      //
      // print("${SharedPreferenceUtils.getString("eamAPIBaseURL","")}");

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const LoginPage()),
      // );
      Navigator.pop(context);
    }
  }
}
