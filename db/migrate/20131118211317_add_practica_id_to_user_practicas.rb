class AddPracticaIdToUserPracticas < ActiveRecord::Migration
  def change
  	add_column :user_practicas, :practica_id, :integer
  end
end
