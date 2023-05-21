class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages_as_sender, class_name: "Message", foreign_key: :sender_id
  has_many :messages_as_receiver, class_name: "Message", foreign_key: :receiver_id
  has_many :consultations_as_mentee, class_name: "Consultation", foreign_key: :mentee_id
  has_many :consultations_as_mentor, class_name: "Consultation", foreign_key: :mentor_id
  has_one_attached :photo # For cloudinary connection and user profile pic
  has_many :experiences
  has_many :educations
end
