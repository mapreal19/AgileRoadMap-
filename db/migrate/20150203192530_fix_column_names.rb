class FixColumnNames < ActiveRecord::Migration
  def change
    change_table :practicas do |t|
      t.rename :name, :name_es
      t.rename :description, :description_es
    end
  end

end