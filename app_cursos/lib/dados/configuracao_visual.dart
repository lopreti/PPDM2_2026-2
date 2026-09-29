import 'package:flutter/material.dart';

class ConfiguracaoVisual {
  const ConfiguracaoVisual({
    required this.modoEscuro,
    required this.corPrincipal,
    required this.corMenuInferior,
  });

  final bool modoEscuro;
  final Color corPrincipal;
  final Color corMenuInferior;

  ConfiguracaoVisual copyWith({
    bool? modoEscuro,
    Color? corPrincipal,
    Color? corMenuInferior,
  }) {
    return ConfiguracaoVisual(
      modoEscuro: modoEscuro ?? this.modoEscuro,
      corPrincipal: corPrincipal ?? this.corPrincipal,
      corMenuInferior: corMenuInferior ?? this.corMenuInferior,
    );
  }
}

final ValueNotifier<ConfiguracaoVisual> configuracaoVisual =
    ValueNotifier<ConfiguracaoVisual>(
  const ConfiguracaoVisual(
    modoEscuro: false,
    corPrincipal: Color(0xff0f766e),
    corMenuInferior: Color(0xff153243),
  ),
);