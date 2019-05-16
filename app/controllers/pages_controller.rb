class PagesController < ApplicationController
	require 'csv'

	def home
		CSV.foreach('public/Import task - Candidates.csv', headers: true) do |row|
			candidate_name = row[0]
			candidate_email = row[1]
			candidate_phone = row[2]
			candidate_created = DateTime.parse(row[4])
			job = Job.find_by(name: row[3].downcase.strip)
			candidate = Candidate.find_by(email: candidate_email)
			if job.nil?
				job = Job.create(name: row[3].downcase.strip)
			end
			if candidate.nil?
				Candidate.create(name: candidate_name, email: candidate_email, phone: candidate_phone, job: job, created_at: candidate_created)
			end
		end

		CSV.foreach('public/Import task - Notes.csv', headers: true) do |row|
			candidate = Candidate.find_by(email: row[0])
			if candidate.present?
				notes = row[1]
				note = Note.create(content: notes, candidate: candidate)
			end
		end
	end

	def import
		if params[:file][:import_candidates].present?
			uploaded_file = params[:file][:import_candidates].tempfile
    		helpers.import_candidates(uploaded_file)
		end
		if params[:file][:import_notes].present?
			uploaded_file = params[:file][:import_notes].tempfile
    		helpers.import_notes(uploaded_file)
		end
		redirect_to root_path, flash: {notice: "Successfully imported the data."}
	end
end
