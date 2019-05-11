class Candidate < ApplicationRecord
	has_many :notes
	belongs_to :job
end
