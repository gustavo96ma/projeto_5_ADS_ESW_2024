import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PaginaListaChats extends StatelessWidget {
  const PaginaListaChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: const Icon(Icons.logout))
          ],
          title: const Text('Página Lista de Chats'),
        ),
        body: const Placeholder(),
      ),
    );
  }
}
