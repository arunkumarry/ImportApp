module PagesHelper
	def import_candidates(file)
		CSV.foreach(file, headers: true) do |row|
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
	end

	def import_notes(file)
		CSV.foreach(file, headers: true) do |row|
			candidate = Candidate.find_by(email: row[0])
			if candidate.present?
				notes = row[1]
				note = Note.create(content: notes, candidate: candidate)
			end
		end
	end
end
