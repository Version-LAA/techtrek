class UserSpokenLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :spoken_language
end
