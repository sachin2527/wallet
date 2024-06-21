import 'package:flutter/material.dart';

class Send extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView( // Allow scrolling if content overflows
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField( // Recipient Address field
              decoration: InputDecoration(
                labelText: 'Recipient Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Text(
                  'ETH',
                  style: TextStyle(fontSize: 16.0),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down), // Dropdown for coin selection?
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10.0),
            TextField( // Amount field
              decoration: InputDecoration(
                labelText: 'AMOUNT',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number, // For numeric input
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Balance: 0.00 ETH'), // Assuming a balance display
                ElevatedButton(
                  onPressed: () {}, // Handle send button press
                  child: Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
