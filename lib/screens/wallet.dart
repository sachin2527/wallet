import 'package:flutter/material.dart';
import 'package:wallet/screens/send.dart';
import 'package:wallet/screens/swap.dart';
import 'token_screen.dart';
import 'activity_screen.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<Wallet> {
  int _selectedIndex = 0;
  String _selectedNetwork = 'Polygon Mainnet';
  bool isEthereumNetwork = false;

  List<Widget> _widgetOptionsPolygon = [
    TokensScreen(),
    ActivityScreen(),
  ];

  List<Widget> _widgetOptionsEthereum = [
    TokensScreenEthereum(),
    ActivityScreenEthereum(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _copyAddress() {
    final snackBar = SnackBar(content: Text('Address copied to clipboard'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showNetworkSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text('Select Network', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.circle, color: Colors.purple),
                title: Text('Polygon Mainnet', style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    _selectedNetwork = 'Polygon Mainnet';
                    isEthereumNetwork = false;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.circle, color: Colors.green),
                title: Text('Ethereum', style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    _selectedNetwork = 'Ethereum';
                    isEthereumNetwork = true;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow
        title: Text('Wallet'),
        backgroundColor: Colors.black,
        actions: [
          Row(
            children: [
              Icon(
                Icons.circle,
                color: isEthereumNetwork ? Colors.green : Colors.purple,
                size: 12,
              ),
              SizedBox(width: 4),
              TextButton(
                onPressed: _showNetworkSelectionDialog,
                child: Text(
                  _selectedNetwork,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Balance',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '\$0.00',
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text(
                                '0xB82B...27279',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(width: 5),
                              // GestureDetector(
                              //   // onTap: (){},
                              //   child: Icon(Icons.copy, color: Colors.grey, size: 16),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Send()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16.0), // Add padding
                        minimumSize: Size(double.infinity, 50.0), // Increase height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.blueAccent, // Use primary for color
                      ),
                      child:  Column(
                        mainAxisSize: MainAxisSize.min, // Wrap content vertically
                        children: [
                          Icon(Icons.send, color: Colors.white),
                          SizedBox(height: 8.0),
                          Text('Send', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SwapScreen()),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.swap_horiz, color: Colors.white),
                          SizedBox(height: 8.0),
                          Text('Swap', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16.0),
                        minimumSize: Size(double.infinity, 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _onItemTapped(0);
                    },
                    child: Text(
                      'Tokens',
                      style: TextStyle(
                        color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      _onItemTapped(1);
                    },
                    child: Text(
                      'Activity',
                      style: TextStyle(
                        color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey),
              isEthereumNetwork
                  ? _widgetOptionsEthereum.elementAt(_selectedIndex)
                  : _widgetOptionsPolygon.elementAt(_selectedIndex),
            ],
          ),
        ),
      ),
    );
  }
}

class TokensScreenEthereum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.currency_bitcoin, color: Colors.grey),
            title: Text('Ethereum', style: TextStyle(color: Colors.white)),
            trailing: Text('0.00', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.monetization_on_sharp, color: Colors.lightBlueAccent),
            title: Text('Jesus Coin', style: TextStyle(color: Colors.white)),
            trailing: Text('0.00', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class ActivityScreenEthereum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You have no transaction', style: TextStyle(color: Colors.white)),
    );
  }
}
