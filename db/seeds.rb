# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Post.delete_all
Comment.delete_all
User.delete_all

u1 = User.create(
  email: Faker::Internet.email,
  password: "12345678"
)

u2 = User.create(
  email: Faker::Internet.email,
  password: "12345678"
)

3.times do
  post = Post.create(
    {
      title: Faker::Lorem.sentence(2),
      content: Faker::Lorem.paragraph,
      user: [u1, u2].sample
    }
  )
  2.times do
    post.comments.create(
      {
        content: Faker::Lorem.paragraph,
        user: [u1, u2].sample
      }
    )
  end
end
