
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultScreen extends StatefulWidget {  
  final String text;

  const ResultScreen({ required this.text});
  //const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

void _copyTextToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Text copied to clipboard")),
    );
  }
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: const Text('Result'),
        ),
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child:Column(
            children: [ 
              
              Text(widget.text),
              ElevatedButton(
              onPressed: _copyTextToClipboard,
              child: const Text("Copy Text"),
            ),
            ],
          ) 
          
        ),
        
  );
}



















