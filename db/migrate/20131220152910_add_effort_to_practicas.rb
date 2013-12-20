class AddEffortToPracticas < ActiveRecord::Migration
  def change
    add_column :practicas, :effort, :integer
  end
end
