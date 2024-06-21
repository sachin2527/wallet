
import 'package:flutter/material.dart';

class TokensScreen extends StatelessWidget {
  const TokensScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          leading: Icon(Icons.token, color: Colors.yellow),
          title: Text('VIBLE', style: TextStyle(color: Colors.white)),
          trailing: Text('5 \$VIBLE', style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          leading: Icon(Icons.currency_bitcoin, color: Colors.purple),
          title: Text('Polygon', style: TextStyle(color: Colors.white)),
          trailing: Text('0 MATIC', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
