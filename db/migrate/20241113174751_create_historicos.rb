class CreateHistoricos < ActiveRecord::Migration[8.0]
  def change
    create_table :historicos do |t|
      t.references :ordem_servico, null: false, foreign_key: true
      t.text :tipo_serivco
      t.datetime :data

      t.timestamps
    end
  end
end
