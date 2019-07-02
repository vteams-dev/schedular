class Company < ApplicationRecord
  validates :email,:name,:phone,presence: true

  has_many :calenders, as: :owner
end
