import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _modoLogin = true;
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();
  final TextEditingController _controladorNome = TextEditingController();
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
                      TextField(
                        controller: _controladorEmail,
                        cursorColor: Colors.grey,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 12.5,
                      ),
                      TextField(
                        controller: _controladorSenha,
                        cursorColor: Colors.grey,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          label: Text('Senha'),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      if (_modoLogin)
                        const SizedBox(
                          height: 50,
                        ),
                      if (!_modoLogin)
                        const SizedBox(
                          height: 12.5,
                        ),
                      if (!_modoLogin)
                        TextField(
                          controller: _controladorNome,
                          cursorColor: Colors.grey,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            label: Text('Nome'),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      if (!_modoLogin)
                        const SizedBox(
                          height: 25,
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
                              onPressed: () {
                                print(_controladorEmail);
                                print(_controladorSenha);
                                print(_controladorNome);
                                setState(() {
                                  _modoLogin = true;
                                });
                              },
                              label: _modoLogin
                                  ? const Text('Login')
                                  : const Text('Voltar'),
                              icon: _modoLogin
                                  ? const Icon(Icons.login)
                                  : const Icon(Icons.arrow_back)),
                          const SizedBox(width: 6.25),
                          TextButton.icon(
                            style: ButtonStyle(
                              foregroundColor:
                                  const WidgetStatePropertyAll(Colors.white),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.green[400]),
                            ),
                            onPressed: () {
                              setState(() {
                                _modoLogin = false;
                              });
                            },
                            label: _modoLogin
                                ? const Text('Cadastrar-se')
                                : const Text('Cadastrar'),
                            icon: _modoLogin
                                ? const Icon(Icons.person_add_alt)
                                : const Icon(Icons.check_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
