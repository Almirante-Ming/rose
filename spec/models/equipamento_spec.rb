require 'rails_helper'

RSpec.describe Equipamento, type: :model do
  it 'is valid with valid attributes' do
    equipamento = Equipamento.new(nome: 'Impressora', descricao: 'Impressora de alta qualidade')
    expect(equipamento).to be_valid
  end

  it 'is invalid without a nome' do
    equipamento = Equipamento.new(nome: nil, descricao: 'Impressora de alta qualidade')
    expect(equipamento).to_not be_valid
  end

  it 'is invalid without a descricao' do
    equipamento = Equipamento.new(nome: 'Impressora', descricao: nil)
    expect(equipamento).to_not be_valid
  end

  it 'has many ordens de serviço' do
    equipamento = Equipamento.reflect_on_association(:ordens_de_servico)
    expect(equipamento.macro).to eq(:has_many)
  end
end
