class AddAmbitoTrabajoIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ambito_trabajo_id, :integer
  end
end
