class Calender < ApplicationRecord
  validates :title,presence: true
  validates :owner_id, presence: true
  validates :owner_type, presence: true

  belongs_to :owner, polymorphic: true
  has_many :events, dependent: :destroy
end