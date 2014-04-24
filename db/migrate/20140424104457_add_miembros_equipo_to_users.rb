class AddMiembrosEquipoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :miembros_equipo, :integer
  end
end
