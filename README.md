# 🤖 Chatbot Estilo Instagram com Ruby on Rails + Node.js

Bem-vindo ao projeto de um chatbot integrado, com interface inspirada no Instagram, utilizando **Ruby on Rails no backend principal** e **Node.js como microserviço inteligente** para processamento de mensagens.

Este projeto foi desenvolvido com o objetivo de estudar integração entre tecnologias distintas e simular uma aplicação real voltada para grandes clientes, como parques temáticos e entidades públicas.

---

## 💡 Objetivo

Simular um sistema de atendimento automatizado para redes sociais, onde usuários comentam em uma publicação e o bot responde automaticamente com base em palavras-chave e intenções.

---

## 🛠 Tecnologias Utilizadas

| Tecnologia        | Finalidade                           |
|-------------------|---------------------------------------|
| **Ruby on Rails** | Backend principal e persistência de dados |
| **Node.js (Express)** | Microserviço responsável pelas respostas do bot |
| **HTML/CSS/JS**   | Interface do "post Instagram" simulada |
| **PostgreSQL** (ou outro banco via ActiveRecord) | Armazenamento de mensagens e usuários |

---

## 🧠 Como Funciona

### 🔗 Fluxo resumido da aplicação:

1. Usuário envia um comentário via interface simulada do Instagram.
2. O **Rails** envia essa mensagem ao microserviço em **Node.js**.
3. O **Node.js** detecta a intenção da mensagem com base em palavras-chave e responde.
4. A resposta é devolvida para o Rails, salva no banco de dados e exibida no chat.

---

## 📁 Estrutura do Projeto
.
├── app/
│ ├── controllers/
│ │ └── messages_controller.rb
│ ├── views/
│ │ └── messages/chat.html.erb
│ ├── models/
│ └── message.rb
│ └── instagram_user.rb
│
├── config/
│ └── routes.rb
│
├── db/
│ └── seeds.rb
│


---

## 🔍 Funcionalidades

- [x] Envio e recepção de mensagens estilo Direct do Instagram
- [x] Respostas automáticas baseadas em palavras-chave
- [x] Microserviço em Node.js desacoplado do backend Rails
- [x] Criação de usuários simulados para testes
- [x] Estilização personalizada com CSS para simular post do Instagram
- [ ] Integração com API oficial do Instagram *(em progresso)*
- [ ] Histórico de interações por usuário *(em progresso)*

---

## 📦 Instalação

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/chatbot-instagram-clone.git
cd chatbot-instagram-clone

bundle install
yarn install # se estiver usando Webpacker


rails db:create db:migrate db:seed


rails server


cd node-bot
npm install
node index.js

```

🔄 Exemplo de uso

Acesse http://localhost:3000, comente algo como "adorei a aventura!" e veja o bot responder automaticamente. 🧠✨



🧪 Futuras Melhorias

✅ Integração com APIs reais (Instagram, WhatsApp)
✅ Implementar IA (OpenAI, Dialogflow)
✅ Dashboard Admin para histórico de conversas
✅ Respostas personalizadas por perfil
✅ Gamificação (ex: prêmios para quem comenta mais)

📸 Captura de Tela
![alt text](image.png)

👨‍💻 Autor

Desenvolvido por Leonardo Veras

Desenvolvedor focado em Ruby on Rails, atualmente explorando integrações com Node.js, interfaces modernas e sistemas de automação.