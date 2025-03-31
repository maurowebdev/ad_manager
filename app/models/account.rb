class Account < ApplicationRecord
  has_many :users
  has_many :ads

  validates :name, presence: true
end
