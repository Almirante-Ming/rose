class CreateEquipamentos < ActiveRecord::Migration[8.0]
  def change
    create_table :equipamentos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.string :nome
      t.string :marca
      t.string :modelo

      t.timestamps
    end
  end
end
