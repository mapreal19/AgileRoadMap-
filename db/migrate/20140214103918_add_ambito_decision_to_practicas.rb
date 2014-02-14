class AddAmbitoDecisionToPracticas < ActiveRecord::Migration
  def change
    add_column :practicas, :ambito_decision, :string
  end
end
