import 'package:flutter/material.dart';
import '../dados/favoritos.dart';
import '../widgets/curso_card.dart';

class CursoTela extends StatefulWidget {
  const CursoTela({super.key});

  @override
  State<CursoTela> createState() => _CursoTelaState();
}

class _CursoTelaState extends State<CursoTela> {
  final TextEditingController _pesquisaController = TextEditingController();

final List<String> _cursos = const [
  'Flutter Básico',
  'Dart Essencial',
  'Interface Mobile',
  'Conexão API',
  'Banco de Dados',
  'Desenvolvimento Mobile',
  'HTML e CSS',
  'JavaScript',
  'React',
  'Node.js',
  'Java',
  'Python',
];

  @override
  void dispose() {
    _pesquisaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cursosFiltrados = _cursos
        .where((curso) => curso.toLowerCase().contains(
              _pesquisaController.text.toLowerCase(),
            ))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            controller: _pesquisaController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Pesquisar curso',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _pesquisaController.text.isEmpty
                  ? null
                  : IconButton(
                      tooltip: 'Limpar pesquisa',
                      onPressed: () {
                        _pesquisaController.clear();
                        setState(() {});
                      },
                      icon: const Icon(Icons.clear),
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
        Expanded(
          child: cursosFiltrados.isEmpty
              ? const Center(child: Text('Nenhum curso encontrado'))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: cursosFiltrados.length,
                  itemBuilder: (context, indice) {
                    final curso = cursosFiltrados[indice];
                    final favorito = cursosFavoritos.value.contains(curso);

                    return CursoCard(
                      curso: curso,
                      favorito: favorito,
                      onFavoritoPressed: () {
                        final favoritosAtualizados =
                            Set<String>.from(cursosFavoritos.value);
                        if (favorito) {
                          favoritosAtualizados.remove(curso);
                        } else {
                          favoritosAtualizados.add(curso);
                        }
                        cursosFavoritos.value = favoritosAtualizados;
                        setState(() {});
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class CursoDescrito extends StatelessWidget{
  const CursoDescrito({super.key});

  @override
  Widget build(BuildContext context){
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'O curso ',
          style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(fontWeight: FontWeight.bold,
          ),
        ),
      ]
    );
  }
}