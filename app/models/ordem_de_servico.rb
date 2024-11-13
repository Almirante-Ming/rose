class OrdemDeServico < ApplicationRecord
  belongs_to :cliente
  belongs_to :equipamento
  has_many :historicos

  validates :descricao, presence: true
end
