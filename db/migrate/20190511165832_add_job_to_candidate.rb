class AddJobToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_reference :candidates, :job, foreign_key: true
  end
end
