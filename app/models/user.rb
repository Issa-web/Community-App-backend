class User < ApplicationRecord
    has_secure_password

    has_many :posts
    has_many :comments

    has_many :friendships 
    has_many :friends, :through => :friendships
    
    has_many :receive_messages, foreign_key: :receiver_id, class_name: "Chat"
    has_many :receivers, through: :receive_messages
    
    has_many :sent_messages, foreign_key: :sender_id, class_name: "Chat"
    has_many :senders, through: :sent_messages

    def chats
        self.sent_messages + self.receive_messages
        
    end

    def all_messages
        self.chats.map{ |chat| chat.messages}
        
    end
    validates :username, :password, presence: true
end
