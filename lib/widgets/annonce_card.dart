import 'package:flutter/material.dart';
import '../pages/annonce_detail_page.dart';

class AnnonceCard extends StatelessWidget {
  final Map<String, dynamic> annonce;

  const AnnonceCard({Key? key, required this.annonce}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(annonce['titre']),
        subtitle: Text("Prix : ${annonce['prix']} €"),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnnonceDetailPage(annonce: annonce),
            ),
          );
        },
      ),
    );
  }
}
