class ChangeVoteValueType < ActiveRecord::Migration
  def change
    change_column :votes, :value, :integer
  end
end
