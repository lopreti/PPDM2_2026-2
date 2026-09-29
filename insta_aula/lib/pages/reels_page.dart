import 'package:flutter/material.dart';
import 'package:insta_aula/widgets/botao_reel.dart';
import 'package:insta_aula/utils/mensagem_util.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Icon(
              Icons.play_circle,
              color: Colors.white54,
              size: 120,
            ),
          ),
          const Positioned(
            top: 16,
            left: 16,
            child: Text(
              'Reels',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            left: 16,
            right: 80,
            bottom: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@Flutter.dev',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Aprendendo a criar aplicativos incríveis com Flutter!',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),

          Positioned(
            right: 12,
            bottom: 24,
            child: Column(
              children: [
                BotaoReel(
                  icone: Icons.favorite,
                  texto: '2,5k',
                  aoTocar: () {
                    mostrarMensagem(context, 'Você curtiu o Reel!');
                  },
                ),
                BotaoReel(
                  icone: Icons.comment,
                  texto: '67',
                  aoTocar: () {
                    mostrarMensagem(context, 'Você curtiu o Reel!');
                  },
                ),
                BotaoReel(
                  icone: Icons.send,
                  texto: 'Compartilhar',
                  aoTocar: () {
                    mostrarMensagem(context, 'Você curtiu o Reel!');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
