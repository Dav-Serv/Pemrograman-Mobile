import 'package:flutter/material.dart';
import '../screens/about_screen.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 1,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            label: const Text('Edit'),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 1,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.share),
            label: const Text('Bagikan'),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 1,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
            icon: const Icon(Icons.info),
            label: const Text('Tentang'),
          ),
        ),
      ],
    );
  }
}