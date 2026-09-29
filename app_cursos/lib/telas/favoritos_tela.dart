import 'package:flutter/material.dart';
import '../dados/favoritos.dart';
import '../widgets/curso_card.dart';

class FavoritosTela extends StatelessWidget {
  const FavoritosTela({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<String>>(
      valueListenable: cursosFavoritos,
      builder: (context, favoritos, _) {
        return favoritos.isEmpty
            ? const Center(child: Text('Nenhum curso favorito'))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: favoritos.length,
                itemBuilder: (context, indice) {
                  final curso = favoritos.elementAt(indice);
                  return CursoCard(
                    curso: curso,
                    favorito: true,
                    onFavoritoPressed: () {
                      final favoritosAtualizados = Set<String>.from(favoritos)
                        ..remove(curso);
                      cursosFavoritos.value = favoritosAtualizados;
                    },
                  );
                },
              );
      },
    );
  }
}