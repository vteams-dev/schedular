class Calender < ApplicationRecord
  validates :title,:owner_id,:owner_type, presence: true

  belongs_to :owner, polymorphic: true
  has_many :events, dependent: :destroy
end
