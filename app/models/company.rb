class Company < ApplicationRecord

  validates :email,presence: true
  validates :name, presence: true
  validates :phone, presence: true

  has_many :calenders, as: :owner
end

