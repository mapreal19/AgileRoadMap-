class FixColumnNames < ActiveRecord::Migration
  def change
    change_table :practicas do |t|
      t.rename :name, :name_es
    end
  end

end