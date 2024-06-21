import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.swap_horiz, color: Colors.redAccent),
          title: Text('Swapped VIBLE for MATIC', style: TextStyle(color: Colors.white)),
          subtitle: Text('20/06/2024', style: TextStyle(color: Colors.grey)),
        ),
        ListTile(
          leading: Icon(Icons.send, color: Colors.blueAccent),
          title: Text('Sent 5 VIBLE', style: TextStyle(color: Colors.white)),
          subtitle: Text('19/06/2024', style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}
