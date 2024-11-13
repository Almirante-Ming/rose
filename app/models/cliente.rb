class Cliente < ApplicationRecord
  has_many :equipamentos, dependent: :destroy
  validates :nome, presence: true
end
