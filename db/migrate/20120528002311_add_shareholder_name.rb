class AddShareholderName < ActiveRecord::Migration
  def change
    add_column :shareholders, :name, :string
  end
end
