import 'package:flutter/material.dart';
import 'dados/configuracao_visual.dart';
import 'telas/perfil_tela.dart';
import 'telas/cursos_tela.dart';
import 'telas/inicio_tela.dart';
import 'telas/favoritos_tela.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ConfiguracaoVisual>(
      valueListenable: configuracaoVisual,
      builder: (context, configuracao, _) {
        final brightness = configuracao.modoEscuro
            ? Brightness.dark
            : Brightness.light;
        final scheme = ColorScheme.fromSeed(
          seedColor: configuracao.corPrincipal,
          brightness: brightness,
        );

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: scheme,
            scaffoldBackgroundColor: configuracao.modoEscuro
                ? const Color(0xff101817)
                : const Color(0xfff4f7f6),
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              backgroundColor: configuracao.corPrincipal,
              foregroundColor: scheme.onPrimary,
            ),
            cardTheme: CardThemeData(
              color: configuracao.modoEscuro
                  ? const Color(0xff1c2927)
                  : Colors.white,
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(color: scheme.outlineVariant),
              ),
            ),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState ()=> _HomePageState();

}

class _HomePageState extends State<HomePage>{
  int indice = 0;

final telas = const [
  InicioTela(),
  CursoTela(),
  FavoritosTela(),
  PerfilTela(),
 
];

final titulos = const [
  'Inicio',
  'Meus cursos',
  'Meus Favoritos',
  'Meu perfil',
  
];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:  Text(titulos[indice]),
      ),
      body: telas[indice],

      bottomNavigationBar: NavigationBar(
        
        onDestinationSelected: (valor){
          setState(() {
            indice = valor;
          });
        },
        selectedIndex: indice,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
             label: 'Inicio'),
             NavigationDestination(
            icon: Icon(Icons.school_outlined),
             label: 'Cursos'),
             NavigationDestination(
            icon: Icon(Icons.favorite),
             label: 'Favoritos'),
             NavigationDestination(
            icon: Icon(Icons.person_2_outlined),
             label: 'Perfil'),
             
        ],),
    );
  }
}