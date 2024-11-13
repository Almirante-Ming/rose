class CreateOrdemServicos < ActiveRecord::Migration[8.0]
  def change
    create_table :ordem_servicos do |t|
      t.references :equipamento, null: false, foreign_key: true
      t.string :descricao
      t.string :status
      t.date :data_abertura

      t.timestamps
    end
  end
end
