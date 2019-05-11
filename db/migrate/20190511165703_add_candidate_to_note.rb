class AddCandidateToNote < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :candidate, foreign_key: true
  end
end
