# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Chat.destroy_all
User.destroy_all
Post.destroy_all
Comment.destroy_all
Friendship.destroy_all

10.times {User.create(username: Faker::Name.unique.name, password: "lalalala", image:nil)}
10.times{
    Chat.create(
        sender: User.all.sample, 
        receiver: User.all.sample
        )
}

10.times {
    Post.create(user_id: User.all.sample.id, description: Faker::Quote.matz )
}
10.times {
    Comment.create(user_id: User.all.sample.id, post_id: Post.all.sample.id, content:Faker::Marketing.buzzwords)
}

10.times {
    Message.create(message_content: Faker::App.name, chat_id: Chat.all.sample.id)
}

10.times {

}

10.times{
    Friendship.create(user_id: User.all.sample.id, friend_id: User.all.sample.id)
}
# x =25
# 4.times do |x|
#     Chat.create(sender:User.find(85), receiver:User.find(86))
#     x = x +1
# end
# user1 = User.create(username: "Issa", password:"password")
# user2 = User.create(username: "JR", password:"password")

# chat1 = Chat.create(sender_id:1, receiver_id:2)
