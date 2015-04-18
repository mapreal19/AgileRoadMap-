class ChangeNameAttrToObjetivo < ActiveRecord::Migration
  def change
    add_column :objetivos, :name_en, :string
    add_column :ambito_trabajos, :name_en, :string
    add_column :sector_empresas, :name_en, :string
    change_table :objetivos do |t|
      t.rename :name, :name_es
    end
    change_table :ambito_trabajos do |a|
      a.rename :nombre, :name_es
    end
    change_table :sector_empresas do |s|
      s.rename :nombre, :name_es
    end
  end
end
