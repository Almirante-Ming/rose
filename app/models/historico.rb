class Historico < ApplicationRecord
  belongs_to :ordem_servico
  validates :acao, :data, presence: true
end
