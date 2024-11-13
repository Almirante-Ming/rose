class Equipamento < ApplicationRecord
  belongs_to :cliente
  has_many :ordens_servico, dependent: :destroy
  validates :nome, :marca, presence: true
end
