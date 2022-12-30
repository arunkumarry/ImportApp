require 'rails_helper'

RSpec.describe Candidate, type: :model do
  context 'validation tests' do
  	it 'ensures name presence' do
  		candidate = Candidate.new(email: "aa@gmail.com", job: Job.first).save
  		expect(candidate).to eq(false)
  	end

  	it 'ensures email presence' do
  		candidate = Candidate.new(name: "aa@gmail.com", job: Job.first).save
  		expect(candidate).to eq(false)
  	end

  	it 'ensures job presence' do
  		candidate = Candidate.new(email: "aa@gmail.com", name: "Aa").save
  		expect(candidate).to eq(false)
  	end

  	it 'should save successfully' do
  		candidate = Candidate.new(name: "Aa", email: "aa@gmail.com", job: Job.first).save
  		expect(candidate).to eq(true)
  	end
  end

  context 'scope tests' do

  end
end
