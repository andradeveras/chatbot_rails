# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  require 'net/http'
  skip_before_action :verify_authenticity_token

  def create
    user_message = params[:content] #Pega a mensagem do usuário
    user = InstagramUser.order("RANDOM()").first #Seleciona um usuário aleatório do InstagramUser
    raise "Nenhum InstagramUser encontrado!" unless user 

    #Endpoint do bot para processar a mensagem do user, requisiçao HTTP POST
    uri = URI('http://localhost:3001/process-message')
    response = Net::HTTP.post(
      uri,
      { message: user_message }.to_json, #Converte a mensagem do usuário para JSON
      "Content-Type" => "application/json"
    )

    bot_reply = JSON.parse(response.body)["reply"]

    Message.create!( 
      instagram_user: user,
      content: user_message,
      reply: bot_reply
    )# Cria uma nova mensagem associada ao usuário selecionado e ao bot respondendo a mensagem do usuário

    render json: {
    reply: "@#{user.username} #{bot_reply}",
    username: user.username,
    user_message: user_message

  }, status: :created # Responde com a mensagem do bot e o nome de usuário do InstagramUser
  rescue => e
    puts "❌ Erro no create: #{e.message}"
    render json: { error: e.message }, status: 422
  end

  # Método para exibir o chat
  # Exibe todas as mensagens do usuário selecionado
  # Ordenadas por data de criação
  # Exemplo: GET /messages/chat?user_id=1
  # Retorna todas as mensagens do usuário com ID 1
  # Exibe as mensagens em ordem crescente de data de criação
  def chat
    @messages = Message.where(user_id: params[:user_id]).order(created_at: :asc)
  end
end
