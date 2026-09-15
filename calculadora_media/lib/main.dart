import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple, useMaterial3: true),
      home: const MediaEscolarPage(),
    );
  }
}

class MediaEscolarPage extends StatefulWidget {
  const MediaEscolarPage({super.key});

  @override
  State<MediaEscolarPage> createState() => _MediaEscolarPageState();
}

class _MediaEscolarPageState extends State<MediaEscolarPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController nota1Controller = TextEditingController();
  final TextEditingController nota2Controller = TextEditingController();
  final TextEditingController nota3Controller = TextEditingController();
  final TextEditingController nota4Controller = TextEditingController();
  final TextEditingController frequenciaController = TextEditingController();

  String nomeAluno = '';
  String situacao = '';

  double media = 0;
  double maiorNota = 0;
  double menorNota = 0;
  double pontosFaltando = 0;
  double frequencia = 0;

  void calcularMedia() {
    String nome = nomeController.text;

    double? nota1 = double.tryParse(nota1Controller.text.replaceAll(',', '.'));

    double? nota2 = double.tryParse(nota2Controller.text.replaceAll(',', '.'));

    double? nota3 = double.tryParse(nota3Controller.text.replaceAll(',', '.'));

    double? nota4 = double.tryParse(nota4Controller.text.replaceAll(',', '.'));

    double? frequenciaAluno = double.tryParse(
      frequenciaController.text.replaceAll(',', '.'),
    );

    if (nome.isEmpty ||
        nota1 == null ||
        nota2 == null ||
        nota3 == null ||
        nota4 == null ||
        frequenciaAluno == null) {
      mostrarMensagem('Preencha todos os campos.');
      return;
    }

    if (nota1 < 0 ||
        nota1 > 10 ||
        nota2 < 0 ||
        nota2 > 10 ||
        nota3 < 0 ||
        nota3 > 10 ||
        nota4 < 0 ||
        nota4 > 10) {
      mostrarMensagem('As notas devem estar entre 0 e 10.');
      return;
    }

    if (frequenciaAluno < 0 || frequenciaAluno > 100) {
      mostrarMensagem('A frequência deve estar entre 0 e 100%.');
      return;
    }

    double mediaCalculada = (nota1 + nota2 + nota3 + nota4) / 4;

    double maior = nota1;
    double menor = nota1;

    if (nota2 > maior) {
      maior = nota2;
    }

    if (nota3 > maior) {
      maior = nota3;
    }

    if (nota4 > maior) {
      maior = nota4;
    }

    if (nota2 < menor) {
      menor = nota2;
    }

    if (nota3 < menor) {
      menor = nota3;
    }

    if (nota4 < menor) {
      menor = nota4;
    }

    double pontos = 0;

    if (mediaCalculada < 7) {
      pontos = 7 - mediaCalculada;
    }

    String situacaoCalculada;

    if (frequenciaAluno < 75) {
      situacaoCalculada = 'REPROVADO POR FREQUÊNCIA';
    } else if (mediaCalculada >= 7) {
      situacaoCalculada = 'APROVADO';
    } else if (mediaCalculada >= 5) {
      situacaoCalculada = 'RECUPERAÇÃO';
    } else {
      situacaoCalculada = 'REPROVADO';
    }

    setState(() {
      nomeAluno = nome;
      media = mediaCalculada;
      maiorNota = maior;
      menorNota = menor;
      pontosFaltando = pontos;
      frequencia = frequenciaAluno;
      situacao = situacaoCalculada;
    });

    mostrarMensagem('Cálculo realizado!');
  }

  void mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensagem)));
  }

  void limparCampos() {
    nomeController.clear();
    nota1Controller.clear();
    nota2Controller.clear();
    nota3Controller.clear();
    nota4Controller.clear();
    frequenciaController.clear();

    setState(() {
      nomeAluno = '';
      situacao = '';
      media = 0;
      maiorNota = 0;
      menorNota = 0;
      pontosFaltando = 0;
      frequencia = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Média'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFFEDE7F6), Colors.white]),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.school, size: 70, color: Colors.deepPurple),
              const SizedBox(height: 10),
              const Text(
                'Média Escolar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Digite os dados do aluno',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do aluno',
                  hintText: 'Exemplo: Isabella',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: nota1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nota 1',
                  hintText: 'Digite uma nota de 0 a 10',
                  prefixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: nota2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nota 2',
                  hintText: 'Digite uma nota de 0 a 10',
                  prefixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: nota3Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nota 3',
                  hintText: 'Digite uma nota de 0 a 10',
                  prefixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: nota4Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nota 4',
                  hintText: 'Digite uma nota de 0 a 10',
                  prefixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: frequenciaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Frequência (%)',
                  hintText: 'Digite de 0 a 100',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: calcularMedia,
                icon: const Icon(Icons.calculate),
                label: const Text('Calcular média'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: limparCampos,
                icon: const Icon(Icons.delete),
                label: const Text('Limpar'),
              ),
              const SizedBox(height: 25),
              if (situacao.isNotEmpty)
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Color(0xFF7E57C2)],
                      ),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.school, size: 55, color: Colors.white),
                        const SizedBox(height: 10),
                        Text(
                          nomeAluno,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Média: ${media.toStringAsFixed(1)}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Frequência: ${frequencia.toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Maior nota: ${maiorNota.toStringAsFixed(1)}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Menor nota: ${menorNota.toStringAsFixed(1)}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          situacao,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        if (pontosFaltando > 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Pontos para aprovação: '
                              '${pontosFaltando.toStringAsFixed(1)}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
