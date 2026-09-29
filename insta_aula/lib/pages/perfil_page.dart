import 'package:flutter/material.dart';

import '../utils/mensagem_util.dart';
import '../widgets/numero_perfil.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            title: const Text(
              '@lopreti',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  mostrarMensagem(context, 'Criar publicação');
                },
                icon: const Icon(Icons.add_box_outlined),
              ),
              IconButton(
                onPressed: () {
                  mostrarMensagem(context, 'Abrir menu');
                },
                icon: const Icon(Icons.menu),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage(
                          'assets/imagens/foto_minha.jpg',
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: NumeroPerfil(numero: '9', rotulo: 'publicações'),
                      ),
                      Expanded(
                        child: NumeroPerfil(
                          numero: '1.250',
                          rotulo: 'seguidores',
                        ),
                      ),
                      Expanded(
                        child: NumeroPerfil(numero: '380', rotulo: 'seguindo'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Isabella Lopreti',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Estudando Flutter, Dart e desenvolvimento mobile. ',
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        mostrarMensagem(context, 'Editar perfil');
                      },
                      child: const Text('Editar perfil'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.grid_on),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.person_pin_outlined, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, indice) {
              final cores = [
                Colors.deepPurple,
                Colors.pink,
                Colors.blue,
                Colors.orange,
                Colors.teal,
              ];

              return Container(
                color: cores[indice % cores.length],
                child: const Icon(
                  Icons.flutter_dash,
                  color: Colors.white,
                  size: 42,
                ),
              );
            }, childCount: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
          ),
        ],
      ),
    );
  }
}
