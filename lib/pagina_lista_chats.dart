import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaginaListaChats extends StatelessWidget {
  const PaginaListaChats({super.key});

  @override
  Widget build(BuildContext context) {
    final collection =
        FirebaseFirestore.instance.collection('listaDeChats').snapshots();
    return StreamBuilder(
        stream: collection,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('Nenhum chat foi encontrado! Verifique!'),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar os chats!'),
            );
          }

          print(snapshot.data!.docs);
          final listaChats = snapshot.data!.docs;

          return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      icon: const Icon(Icons.logout))
                ],
                title: const Text('Página Lista de Chats'),
              ),
              body: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['chat']),
                  );
                }).toList(),
              ));
        });
  }
}
