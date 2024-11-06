import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaginaChat extends StatefulWidget {
  final String idSala;
  const PaginaChat({super.key, required this.idSala});

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {
  @override
  Widget build(BuildContext context) {
    print("DEBUG! ${widget.idSala}");
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('listDeChats')
            .doc(widget.idSala)
            .collection('chat')
            .orderBy('horaEnvio', descending: false)
            .snapshots(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          print('debug ${snapshot.data!.docs}');

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

          final listMensagens = snapshot.data!.docs;
          print("Lista mensagens $listMensagens");

          return Scaffold(
            appBar: AppBar(title: Text('Unicv App'),),
            body: Placeholder(),
          );
        }
        );
  }
}
