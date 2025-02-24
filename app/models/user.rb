class User < ApplicationRecord
  has_secure_password

  has_many :sessions, class_name: "Users::Session", dependent: :destroy
  has_many :watched, -> { order "watched_at DESC" }, dependent: :destroy

  validates_uniqueness_of :email_address
end
