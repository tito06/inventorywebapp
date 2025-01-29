import 'package:flutter/material.dart';
import 'package:manage_inventory/screens/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                  height: 300,
                  width: 350,
                  child: Card(
                    color: const Color.fromARGB(255, 225, 243, 249),
                    child: Container(
                        margin: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Please Login..",
                              style: TextStyle(fontSize: 25),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: "Email",
                                hintText: "Type email...",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                              ),
                              onChanged: (value) {
                                print("Input: $value");
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: "Password",
                                hintText: "Type password...",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.password),
                              ),
                              onChanged: (value) {
                                print("Input: $value");
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white, // Text color
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Dashboard()));
                                },
                                child: const Text("Login"))
                          ],
                        )),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
