# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  require 'net/http'
  skip_before_action :verify_authenticity_token

  def create
    user_message = params[:content]
    user = InstagramUser.order("RANDOM()").first
    raise "Nenhum InstagramUser encontrado!" unless user

    uri = URI('http://localhost:3001/process-message')
    response = Net::HTTP.post(
      uri,
      { message: user_message }.to_json,
      "Content-Type" => "application/json"
    )

    bot_reply = JSON.parse(response.body)["reply"]

    Message.create!(
      instagram_user: user,
      content: user_message,
      reply: bot_reply
    )

    render json: {
    reply: "@#{user.username} #{bot_reply}",
    username: user.username,
    user_message: user_message

  }, status: :created
  rescue => e
    puts "❌ Erro no create: #{e.message}"
    render json: { error: e.message }, status: 422
  end

  def chat
    @messages = Message.where(user_id: params[:user_id]).order(created_at: :asc)
  end
end
