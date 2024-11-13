require 'rails_helper'

RSpec.describe OrdemDeServico, type: :model do
  it 'is valid with valid attributes' do
    cliente = Cliente.create(nome: 'João Silva', email: 'joao@exemplo.com', telefone: '123456789')
    equipamento = Equipamento.create(nome: 'Impressora', descricao: 'Impressora de alta qualidade')
    ordem_de_servico = OrdemDeServico.new(cliente: cliente, equipamento: equipamento, descricao: 'Serviço de manutenção')
    expect(ordem_de_servico).to be_valid
  end

  it 'is invalid without a cliente' do
    equipamento = Equipamento.create(nome: 'Impressora', descricao: 'Impressora de alta qualidade')
    ordem_de_servico = OrdemDeServico.new(cliente: nil, equipamento: equipamento, descricao: 'Serviço de manutenção')
    expect(ordem_de_servico).to_not be_valid
  end

  it 'is invalid without a equipamento' do
    cliente = Cliente.create(nome: 'João Silva', email: 'joao@exemplo.com', telefone: '123456789')
    ordem_de_servico = OrdemDeServico.new(cliente: cliente, equipamento: nil, descricao: 'Serviço de manutenção')
    expect(ordem_de_servico).to_not be_valid
  end

  it 'has many históricos' do
    ordem_de_servico = OrdemDeServico.reflect_on_association(:historicos)
    expect(ordem_de_servico.macro).to eq(:has_many)
  end
end
