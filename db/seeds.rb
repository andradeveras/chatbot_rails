# # Cria usuário InstagramUser se não existir
# user = InstagramUser.find_or_create_by!(username: "andradeveras")

# # Seleciona esse usuário
# SelectedUser.destroy_all
# SelectedUser.create!(instagram_user: user)
SelectedUser.destroy_all
InstagramUser.destroy_all

usernames = %w[
  joaosilva mariaoliveira carlosrocha anapaula
  felipelima lucianasantos brunomartins
  amandacosta rodrigosoares julianaribeiro
]

usernames.each do |username|
  InstagramUser.create!(
    username: username,
  )
end

puts "✅ 10 usuários Instagram criados"
