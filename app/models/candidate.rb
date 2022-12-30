class Candidate < ApplicationRecord
  has_many :notes
  belongs_to :job

  validates :name, presence: true
  validates :email, presence: true
  validates :job, presence: true
end
