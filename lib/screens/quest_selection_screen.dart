import 'package:flutter/material.dart';

import 'quest_in_progress_screen.dart';

class QuestSelectionScreen extends StatefulWidget {
  const QuestSelectionScreen({super.key});

  @override
  State<QuestSelectionScreen> createState() => _QuestSelectionScreenState();
}

class _QuestSelectionScreenState extends State<QuestSelectionScreen> {
  final TextEditingController _nameController = TextEditingController();

  String selectedMode = 'Solo Mode';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _startQuest() {
    final userName = _nameController.text.trim();

    if (userName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name to start!')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            QuestInProgressScreen(userName: userName, mode: selectedMode),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Your Path')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Choose Your Path',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedMode = 'Solo Mode';
                      });
                    },
                    child: const Text('Solo Mode'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedMode = 'Friendship Mode';
                      });
                    },
                    child: const Text('Friendship Mode'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text('SELECT A LEVEL'),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  final level = index + 1;

                  return Card(
                    child: ListTile(
                      title: Text('Quest Level $level'),
                      trailing: Text('+${100 * level} XP'),
                      onTap: _startQuest,
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _startQuest,
                child: const Text('Start Quest'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
