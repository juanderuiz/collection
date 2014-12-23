class AddTotalToBand < ActiveRecord::Migration
  def change
    add_column :bands, :total, :integer
  end
end
