class InstagramUser < ApplicationRecord
  has_one :selected_user

  after_create :definir_como_selecionado

  private

  def definir_como_selecionado
    SelectedUser.destroy_all
    SelectedUser.create!(instagram_user: self)
  end
end
