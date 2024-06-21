import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/screens/create_wallet.dart';

class LoginState with ChangeNotifier {
  bool _passToggle = true;

  bool get passToggle => _passToggle;

  void togglePasswordVisibility() {
    _passToggle = !_passToggle;
    notifyListeners();
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginState(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
                children: [
                SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(20),
              // child: Image.asset("assets/login.jpg"),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  label: Text("Enter Username", style: TextStyle(color: Colors.grey)),
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Consumer<LoginState>(
                builder: (context, loginState, child) {
                  return TextField(
                    obscureText: loginState.passToggle,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text("Enter Password", style: TextStyle(color: Colors.grey)),
                      prefixIcon: Icon(Icons.lock, color: Colors.grey),
                      suffixIcon: InkWell(
                        onTap: loginState.togglePasswordVisibility,
                        child: loginState.passToggle
                            ? Icon(CupertinoIcons.eye_slash_fill, color: Colors.grey)
                            : Icon(CupertinoIcons.eye_fill, color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightGreen),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Material(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateWallet(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                      child: Center(
                        child: Text(
                          "LogIn",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateWallet(),
                      ),
                    );
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
