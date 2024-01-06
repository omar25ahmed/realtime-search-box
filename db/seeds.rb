Article.destroy_all
Search.destroy_all
User.destroy_all

150.times do
  Article.create(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph(sentence_count: 10)
  )
end

local_user = User.create(ip_address: "::1")

7.times do
  local_user.searches.create(query: "Beloved")
  local_user.searches.create(query: "Game of Thrones")
end

6.times do
  local_user.searches.create(query: "Alchemist")
  local_user.searches.create(query: "Alice's Adventures in Wonderland")
end

3.times do
  local_user.searches.create(query: "Another Country")
end

2.times do
  local_user.searches.create(query: "Atlas Shrugged")
end