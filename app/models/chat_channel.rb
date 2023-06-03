class ChatChannel < ApplicationRecord
  has_many :messages
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  has_many :users, through: :messages
end
