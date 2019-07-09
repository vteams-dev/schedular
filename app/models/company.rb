class Company < ApplicationRecord
  validates_presence_of :email, :name, :phone

  has_many :calendars, as: :owner
end
