class NotesController < ApplicationController
  def index
    @candidate = Candidate.find(params[:candidate_id])
    @notes = @candidate.notes
  end
end
