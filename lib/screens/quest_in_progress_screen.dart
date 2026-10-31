import 'package:flutter/material.dart';

class QuestInProgressScreen extends StatelessWidget {
  final String userName;
  final String mode;

  const QuestInProgressScreen({
    super.key,
    required this.userName,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quest in Progress')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 40),
              const SizedBox(height: 10),
              const Text(
                'Social Media',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text('Quest in Progress:'),
              const SizedBox(height: 10),
              Text(
                'Good luck, $userName!',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Mode: $mode'),
              const SizedBox(height: 20),
              const Text(
                '"Strangers are just friends waiting to be met"',
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Done and Dusted'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
