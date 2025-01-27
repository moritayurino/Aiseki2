# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
genre_names = %w(
  カフェ
  日本料理日本料理
  メキシコ料理
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

User.find(1).posts.create!(title: "Cavello") do |post|
  post.body = "大人気のカフェです。"
  post.address = "東京都千代田区丸の内1丁目"
  post.genre = Genre.find(1)
end

User.find(2).posts.create!(title: "和食屋せん") do |post|
  post.body = "日本料理は美しい！"
  post.address = "愛知県名古屋市中村区名駅１丁目１−４"
  post.genre = Genre.find(2)
end

User.find(3).posts.create!(title: "ShoreditchBar") do |post|
  post.body = 'メキシコ料理好きな方にオススメ！'
  post.address = "大阪府大阪市淀川区西中島5-16-1"
  post.genre = Genre.find(3)
end


Admin.create(email:"snmnlv316@gmail.com", password:"v88td5yt")