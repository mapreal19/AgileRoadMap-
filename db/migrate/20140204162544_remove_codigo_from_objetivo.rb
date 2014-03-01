class RemoveCodigoFromObjetivo < ActiveRecord::Migration
  def change
    remove_column :objetivos, :codigo
  end
end
