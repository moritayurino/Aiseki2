# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
genre_names = %w(
  相席
  スポーツ
  コンサート
)

genre_names.each do |name|
  Genre.create!(name: name)
end

users_attributes = [
  { name: "morita", email: "a@a" },
  { name: "iwasaki", email: "b@b" },
  { name: "morioka", email: "c@c" } 
]

users_attributes.each do |user_attributes|
  User.create!(user_attributes.merge({ password: "v88td5yt" }))
end

User.find(1).posts.create!(title: "席空いてます") do |post|
  post.body = "窓側の席空いてます！足を休ませたい方どうぞ。相席しませんか？"
  post.address = "東京都千代田区丸の内1丁目"
  post.genre = Genre.find(1)
end

User.find(2).posts.create!(title: "テニス") do |post|
  post.body = "テニススクールに通ってますが、練習相手がいなくて困ってます。このあと15時に公園で一緒にテニスしませんか？"
  post.address = "愛知県名古屋市中村区名駅１丁目１−４"
  post.genre = Genre.find(2)
end

User.find(3).posts.create!(title: "アイドル") do |post|
  post.body = '今年12月に開催するあのアイドルが大好きです。一緒に行く相手がいなくて困ってます。ライブ一緒に行きませんか？'
  post.address = "大阪府大阪市淀川区西中島5-16-1"
  post.genre = Genre.find(3)
end


Admin.create(email:"snmnlv316@gmail.com", password:"v88td5yt")