class Calender < ApplicationRecord
  validates_presence_of :title

  belongs_to :owner, polymorphic: true
  has_many :events, dependent: :destroy
end
