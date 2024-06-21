import 'package:flutter/material.dart';
import 'package:wallet/screens/wallet.dart'; // Import your Wallet screen

class CreateWallet extends StatelessWidget {
  final TextEditingController _walletNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Wallet'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _walletNameController,
              style:   TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Wallet Name',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: MouseRegion(
                onEnter: (event) => print("Hovered"), // Placeholder for hover effect
                onExit: (event) => print("Not Hovered"), // Placeholder for hover effect
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.greenAccent.withOpacity(0.2); // Hover effect color
                        }
                        return null; // Default
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.lightGreen),
                      ),
                    ),
                  ),
                  onPressed: () {
                    String walletName = _walletNameController.text;
                    if (walletName.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Wallet(), // Pass walletName if needed
                        ),
                      );
                    } else {
                      // Show an error if wallet name is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a wallet name')),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Text(
                      'Create Wallet',
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
