class CreateSectorEmpresas < ActiveRecord::Migration
  def change
    create_table :sector_empresas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
