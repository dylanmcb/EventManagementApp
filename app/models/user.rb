class User < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :events, through: :registrations
end
