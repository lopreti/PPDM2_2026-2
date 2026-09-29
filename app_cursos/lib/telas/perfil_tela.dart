import 'editar_perfil_tela.dart'; 
import 'package:flutter/material.dart';
import '../dados/configuracao_visual.dart';

class PerfilTela extends StatelessWidget {
  const PerfilTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
            const Center(
              child: CircleAvatar(
                radius: 46,
                child: Icon(Icons.person, size: 52),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Aluno Flutter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'aluno@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            const SizedBox(height: 16),

            // Botão Editar Perfil
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditarPerfilTela(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 55, 153), // Cor personalizada
                  foregroundColor: Colors.white, // Cor do texto
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                //Falta fazer com que o botão mude de cor por causa da personalização do usuário
                child: const Text(
                  'Editar perfil',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 16), 

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ValueListenableBuilder<ConfiguracaoVisual>(
                  valueListenable: configuracaoVisual,
                  builder: (context, configuracao, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Personalização',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Modo escuro'),
                          secondary: const Icon(Icons.dark_mode_outlined),
                          value: configuracao.modoEscuro,
                          onChanged: (valor) {
                            configuracaoVisual.value = configuracao.copyWith(
                              modoEscuro: valor,
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        const Text('Cor principal'),
                        _OpcoesDeCor(
                          selecionada: configuracao.corPrincipal,
                          opcoes: const [
                            Color(0xff0f766e),
                            Color(0xff1565c0),
                            Color(0xff8e24aa),
                            Color(0xffc2410c),
                          ],
                          onChanged: (cor) {
                            configuracaoVisual.value = configuracao.copyWith(
                              corPrincipal: cor,
                            );
                          },
                        ),

                      ],
                    );
                  },
                ),
              ),
            ),

            // Card 1: Flutter Developer em andamento
            const Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Flutter Developer em andamento',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // Card 2: Curso concluído: 8
            const Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Curso concluído: 8',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            
            // Card 3: Aulas concluídas: 18
            const Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Aulas concluídas: 18',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OpcoesDeCor extends StatelessWidget {
  const _OpcoesDeCor({
    required this.selecionada,
    required this.opcoes,
    required this.onChanged,
  });

  final Color selecionada;
  final List<Color> opcoes;
  final ValueChanged<Color> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: opcoes.map((cor) {
        final selecionada = cor == this.selecionada;
        return ChoiceChip(
          label: const SizedBox(width: 24, height: 24),
          selected: selecionada,
          backgroundColor: cor,
          selectedColor: cor,
          side: BorderSide(
            color: selecionada ? Colors.white : Colors.transparent,
            width: 2,
          ),
          onSelected: (_) => onChanged(cor),
        );
      }).toList(),
    );
  }
}