import 'package:flutter/material.dart';
import 'configmanager.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadBaseURL();
  }

  Future<void> _loadBaseURL() async {
    String? url = await ConfigManager.getBaseURL();
    setState(() {
      _urlController.text = url ?? '';
    });
  }

  Future<void> _saveBaseURL() async {
    String url = _urlController.text;
    await ConfigManager.setBaseURL(url);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Base URL saved: $url')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(labelText: 'Base URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveBaseURL,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
