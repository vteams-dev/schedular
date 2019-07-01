class Calender < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :events, dependent: :destroy
end
