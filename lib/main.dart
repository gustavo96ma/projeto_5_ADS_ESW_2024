import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Icon(
                Icons.chat_outlined,
                size: 250,
                color: Colors.green[400],
              ),
              const SizedBox(height: 50),
              Card(
                color: Colors.green[100],
                margin: const EdgeInsets.all(64),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          label: Text('Email'),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12.5,),
                      const TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          label: Text('Senha'),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            style: ButtonStyle(
                              foregroundColor:
                                  const WidgetStatePropertyAll(Colors.white),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.green[400]),
                            ),
                            onPressed: () {},
                            label: const Text('Login'),
                            icon: const Icon(Icons.login),
                          ),
                          const SizedBox(width: 6.25),
                          TextButton.icon(
                            style: ButtonStyle(
                              foregroundColor:
                                  const WidgetStatePropertyAll(Colors.white),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.green[400]),
                            ),
                            onPressed: () {},
                            label: const Text('Cadastrar-se'),
                            icon: const Icon(Icons.person_add_alt),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

