import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CopyTextScreen extends StatefulWidget {
  @override
  _CopyTextScreenState createState() => _CopyTextScreenState();
}

class _CopyTextScreenState extends State<CopyTextScreen> {
  final String textToCopy = "Hello, Flutter!"; // Replace with your desired text

  // Function to copy text to clipboard
  void _copyTextToClipboard() {
    Clipboard.setData(ClipboardData(text: textToCopy));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Text copied to clipboard")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Copy Text Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              textToCopy,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _copyTextToClipboard,
              child: Text("Copy Text"),
            ),
          ],
        ),
      ),
    );
  }
}
