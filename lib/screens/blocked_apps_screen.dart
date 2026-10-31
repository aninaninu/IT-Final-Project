import 'package:flutter/material.dart';

class BlockedAppsScreen extends StatefulWidget {
  const BlockedAppsScreen({super.key});

  @override
  State<BlockedAppsScreen> createState() => _BlockedAppsScreenState();
}

class _BlockedAppsScreenState extends State<BlockedAppsScreen> {
  final List<String> apps = [
    'Instagram',
    'Netflix',
    'Snapchat',
    'TikTok',
    'YouTube',
  ];

  final Set<int> unlockedApps = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blocked Apps')),
      body: ListView.builder(
        itemCount: apps.length,
        itemBuilder: (context, index) {
          final isUnlocked = unlockedApps.contains(index);

          return ListTile(
            leading: Icon(isUnlocked ? Icons.lock_open : Icons.lock),
            title: Text(apps[index]),
            subtitle: Text(isUnlocked ? 'Unlocked' : 'Blocked'),
            onTap: () {
              setState(() {
                if (isUnlocked) {
                  unlockedApps.remove(index);
                } else {
                  unlockedApps.add(index);
                }
              });
            },
          );
        },
      ),
    );
  }
}
