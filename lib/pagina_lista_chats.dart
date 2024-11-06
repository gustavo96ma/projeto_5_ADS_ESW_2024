import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'pagina_chat.dart';

class PaginaListaChats extends StatelessWidget {
  const PaginaListaChats({super.key});

  Future<List<String>> _pegaListaDeChats() async {
    final listaDeChats =
        await FirebaseFirestore.instance.collection('listaDeChats').get();

    return listaDeChats.docs.map((doc) => doc.id).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: _pegaListaDeChats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nenhum chat foi encontrado! Verifique!'),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar os chats!'),
            );
          }

          final listaChats = snapshot.data!;

          return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      icon: const Icon(Icons.logout))
                ],
                title: const Text('Página Lista de Chats'),
              ),
              body: ListView.builder(
                itemCount: listaChats.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaginaChat(idSala: listaChats[index]),
                        ),
                      );
                    },
                    title: Text(listaChats[index]),
                  );
                },
              ));
        });
  }
}
