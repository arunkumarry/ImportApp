class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def notes
    candidate = Candidate.find(params[:id])
    @notes = candidate.notes
  end
end
