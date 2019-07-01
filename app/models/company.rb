class Company < ApplicationRecord
  has_many :calenders, as: :owner
end
