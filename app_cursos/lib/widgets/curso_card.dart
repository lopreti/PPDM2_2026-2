import 'package:flutter/material.dart';

class CursoCard extends StatelessWidget {
  const CursoCard({
    required this.curso,
    required this.favorito,
    required this.onFavoritoPressed,
    super.key,
  });

  final String curso;
  final bool favorito;
  final VoidCallback onFavoritoPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(curso),
        leading: const CircleAvatar(
          child: Icon(Icons.play_arrow),
        ),
        subtitle: const Text('Toque para continuar'),
        trailing: IconButton(
          tooltip: favorito
              ? 'Remover dos favoritos'
              : 'Adicionar aos favoritos',
          icon: Icon(
            favorito ? Icons.favorite : Icons.favorite_border,
            color: favorito ? Colors.red : null,
          ),
          onPressed: onFavoritoPressed,
        ),
      ),
    );
  }
}