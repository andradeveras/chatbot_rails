# Cria usuário InstagramUser se não existir
user = InstagramUser.find_or_create_by!(username: "andradeveras")

# Seleciona esse usuário
SelectedUser.destroy_all
SelectedUser.create!(instagram_user: user)
