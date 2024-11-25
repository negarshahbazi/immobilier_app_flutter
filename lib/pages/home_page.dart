import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/annonces_provider.dart';
import '../widgets/annonce_card.dart';

class HomePage extends StatelessWidget {
  // ignore: use_super_parameters
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final annoncesProvider = Provider.of<AnnoncesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Liste des annonces')),
      body: FutureBuilder(
        future: annoncesProvider.fetchAnnonces(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Erreur lors du chargement'));
          }
          return ListView.builder(
            itemCount: annoncesProvider.annonces.length,
            itemBuilder: (context, index) {
              return AnnonceCard(annonce: annoncesProvider.annonces[index]);
            },
          );
        },
      ),
    );
  }
}
