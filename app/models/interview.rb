class Interview < ApplicationRecord
  validates :description,:interviewee,:interviewers,:methods, presence: true

  belongs_to :event
end
