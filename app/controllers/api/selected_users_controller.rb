module Api
  class SelectedUsersController < ApplicationController
    def show
      selected = SelectedUser.last
      if selected && selected.instagram_user
        render json: { username: selected.instagram_user.username }
      else
        render json: { message: 'Nenhum usuário selecionado' }, status: 404
      end
    end
  end
end