# 📱 Atividades Flutter — PPDM 2026-2

Repositório com as atividades desenvolvidas em **Flutter** durante as aulas do professor **Vitor**, na disciplina de **PPDM 2026-2**.

Cada pasta na raiz é um projeto independente, com seu próprio `pubspec.yaml`.

---

## 📂 Estrutura do repositório

| Pasta | Descrição |
| --- | --- |
| [`login_mockado`](./login_mockado) | **Atividade 01** — Sistema de login com dados mockados (sem backend). |
| [`sistema_login`](./sistema_login) | **Atividades 02 e 03** — Continuação do sistema de login, evoluindo para integração com API REST. |
| [`app_cursos`](./app_cursos) | Aplicativo de listagem/gerenciamento de cursos. |
| [`calculadora_media`](./calculadora_media) | Calculadora de média de notas. |
| [`estilos_menu_inferior`](./estilos_menu_inferior) | Estudo de estilos de menu de navegação inferior (bottom navigation). |
| [`perfil_com_foto`](./perfil_com_foto) | Tela de perfil de usuário com foto. |

---

## 📝 Atividades de login

### Atividade 01 — Login mockado
Sistema de login com credenciais fixas no próprio código, usado para praticar formulários, validação e navegação entre telas.

### Atividade 02 — Continuação do sistema de login
Evolução da atividade anterior, ampliando o fluxo de autenticação e a organização do projeto.

### Atividade 03 — Login com API REST
Sistema de login integrado a uma API REST desenvolvida com Node.js e Express, substituindo os dados mockados por autenticação real via requisições HTTP.

---

## 🛠️ Tecnologias

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [Node.js](https://nodejs.org/)
- [Express](https://expressjs.com/)
- API REST

---

## ▶️ Como executar

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado
- Um emulador Android/iOS ou dispositivo físico conectado
- [Node.js](https://nodejs.org/) (apenas para o projeto que usa a API)

### Rodando um app Flutter

```bash
# 1. Clone o repositório
git clone https://github.com/lopreti/PPDM2_2026-2.git
cd PPDM2_2026-2

# 2. Entre na pasta do projeto desejado
cd login_mockado

# 3. Instale as dependências
flutter pub get

# 4. Execute o app
flutter run
```

### Rodando a API (Atividade 03)

```bash
# Na pasta da API do projeto
npm install
node index.js
```

## 👤 Autor

Desenvolvido por [@lopreti](https://github.com/lopreti) para a disciplina de PPDM 2026-2.
