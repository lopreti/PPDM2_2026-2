import 'package:flutter/material.dart';

import '../services/api_service.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  bool mostrarSenha = false;
  bool mostrarConfirmarSenha = false;
  bool carregando = false;

  Future<void> cadastrar() async {
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;
    String confirmarSenha = confirmarSenhaController.text;

    if (nome.isEmpty ||
        email.isEmpty ||
        senha.isEmpty ||
        confirmarSenha.isEmpty) {
      mostrarMensagem('Preencha todos os campos.');
      return;
    }

    if (!email.contains('@') || !email.contains('.')) {
      mostrarMensagem('Digite um e-mail válido.');
      return;
    }

    if (senha.length < 4) {
      mostrarMensagem('A senha deve ter pelo menos 4 caracteres.');
      return;
    }

    if (senha != confirmarSenha) {
      mostrarMensagem('As senhas não são iguais.');
      return;
    }

    setState(() {
      carregando = true;
    });

    final resposta = await ApiService.cadastrar(
      nome: nome,
      email: email,
      senha: senha,
    );

    if (!mounted) return;

    setState(() {
      carregando = false;
    });

    if (resposta['sucesso']) {
      mostrarMensagem('Cadastro realizado com sucesso!');

      Navigator.pop(context);
    } else {
      mostrarMensagem(resposta['mensagem']);
    }
  }

  void mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFFEDE7F6), Colors.white]),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Icon(Icons.person_add, size: 70, color: Colors.deepPurple),

              const SizedBox(height: 15),

              const Text(
                'Criar conta',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 25),

              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: senhaController,
                obscureText: !mostrarSenha,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        mostrarSenha = !mostrarSenha;
                      });
                    },
                    icon: Icon(
                      mostrarSenha ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: confirmarSenhaController,
                obscureText: !mostrarConfirmarSenha,
                decoration: InputDecoration(
                  labelText: 'Confirmar senha',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        mostrarConfirmarSenha = !mostrarConfirmarSenha;
                      });
                    },
                    icon: Icon(
                      mostrarConfirmarSenha
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: carregando ? null : cadastrar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: carregando
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
