import 'package:flutter/material.dart';

class SwapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Swap', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You pay',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  VerticalDivider(color: Colors.grey),
                  DropdownButton<String>(
                    dropdownColor: Colors.grey[900],
                    value: 'ETH',
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    onChanged: (String? newValue) {},
                    items: <String>['ETH', 'BTC', 'BNB', 'DAI', 'USDT', 'UNI', 'USDC']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            Icon(
                              value == 'ETH'
                                  ? Icons.currency_bitcoin
                                  : value == 'BTC'
                                  ? Icons.currency_bitcoin
                                  : value == 'BNB'
                                  ? Icons.currency_bitcoin
                                  : value == 'DAI'
                                  ? Icons.currency_bitcoin
                                  : value == 'USDT'
                                  ? Icons.currency_bitcoin
                                  : value == 'UNI'
                                  ? Icons.currency_bitcoin
                                  : value == 'USDC'
                                  ? Icons.currency_bitcoin
                                  : Icons.currency_bitcoin,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Balance: 0',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'You receive',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      readOnly: true,
                    ),
                  ),
                  VerticalDivider(color: Colors.grey),
                  DropdownButton<String>(
                    dropdownColor: Colors.grey[900],
                    value: 'ETH',  // Changed from 'Select Token' to 'ETH'
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    onChanged: (String? newValue) {},
                    items: <String>['ETH', 'BTC', 'BNB', 'DAI', 'USDT', 'UNI', 'USDC']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            Icon(
                              value == 'ETH'
                                  ? Icons.currency_bitcoin
                                  : value == 'BTC'
                                  ? Icons.currency_bitcoin
                                  : value == 'BNB'
                                  ? Icons.currency_bitcoin
                                  : value == 'DAI'
                                  ? Icons.currency_bitcoin
                                  : value == 'USDT'
                                  ? Icons.currency_bitcoin
                                  : value == 'UNI'
                                  ? Icons.currency_bitcoin
                                  : value == 'USDC'
                                  ? Icons.currency_bitcoin
                                  : Icons.currency_bitcoin,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Balance: 0',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Swap action
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[800], // Background color
                ),
                child: Text(
                  'Select Token',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
