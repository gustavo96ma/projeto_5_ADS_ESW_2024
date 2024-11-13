import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tela_login/widgets/mensagens.dart';

class PaginaChat extends StatefulWidget {
  final String idSala;
  const PaginaChat({super.key, required this.idSala});

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {
  final TextEditingController _controladorInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(widget.idSala)
            .collection('chat')
            .orderBy('criadoEm', descending: false)
            .snapshots(),
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

          final listMensagens = snapshot.data!.docs;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text('Unicv app'),
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(Icons.exit_to_app),
                )
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: listMensagens.length,
                      itemBuilder: (context, index) {
                        return Mensagens(
                            conteudoMensagem:
                                listMensagens[index].data()['conteudo'],
                            emailUsuario: listMensagens[index].data()['email']);
                      }),
                ),
                SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controladorInput,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
