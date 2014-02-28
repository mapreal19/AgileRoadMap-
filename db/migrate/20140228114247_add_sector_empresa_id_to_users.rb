class AddSectorEmpresaIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sector_empresa_id, :integer
  end
end
