class CreateVoteHistories < ActiveRecord::Migration
  def change
    create_table :vote_histories do |t|
      t.integer :value
      t.text :candidate_text
      t.integer  "candidate_id"
      t.integer  "shareholder_id"
      t.timestamps
    end
  end
end
