# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token # se for API sem autenticação CSRF

  def create
    user_message = params[:content]
    user = User.find(params[:user_id])

    uri = URI('http://localhost:3001/process-message')
    response = Net::HTTP.post(
      uri,
      { message: user_message }.to_json,
      "Content-Type" => "application/json"
    )

    bot_reply = JSON.parse(response.body)["reply"]

    message = Message.create!(
      user: user,
      content: user_message,
      reply: bot_reply
    )

    render json: message, status: :created
  rescue => e
    render json: { error: e.message }, status: 422
  end
end
