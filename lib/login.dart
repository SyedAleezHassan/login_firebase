import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/home.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
// Function to handle login
  Future<void> _loginUser() async {
    try {
      // Use FirebaseAuth to log in
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      // If successful, navigate to HomePage
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homePage()));
    } catch (e) {
      // For now, just print the error
      print("Login failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Login App"), backgroundColor: Colors.blueGrey),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: emailController,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordController,
          ),
          SizedBox(
            height: 7,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _loginUser();
                });
              },
              child: Text('Login Button'))
        ],
      ),
    );
  }
}
