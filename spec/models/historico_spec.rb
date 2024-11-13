require 'rails_helper'

RSpec.describe Historico, type: :model do
  it 'is valid with valid attributes' do
    cliente = Cliente.create(nome: 'João Silva', email: 'joao@exemplo.com', telefone: '123456789')
    equipamento = Equipamento.create(nome: 'Impressora', descricao: 'Impressora de alta qualidade')
    ordem_de_servico = OrdemDeServico.create(cliente: cliente, equipamento: equipamento, descricao: 'Serviço de manutenção')
    historico = Historico.new(data: '2024-11-14', descricao: 'Histórico de manutenção', ordem_de_servico: ordem_de_servico)
    expect(historico).to be_valid
  end

  it 'is invalid without a data' do
    cliente = Cliente.create(nome: 'João Silva', email: 'joao@exemplo.com', telefone: '123456789')
    equipamento = Equipamento.create(nome: 'Impressora', descricao: 'Impressora de alta qualidade')
    ordem_de_servico = OrdemDeServico.create(cliente: cliente, equipamento: equipamento, descricao: 'Serviço de manutenção')
    historico = Historico.new(data: nil, descricao: 'Histórico de manutenção', ordem_de_servico: ordem_de_servico)
    expect(historico).to_not be_valid
  end

  it 'is invalid without a descricao' do
    cliente = Cliente.create(nome: 'João Silva', email: 'joao@exemplo.com', telefone: '123456789')
    equipamento = Equipamento.create(nome: 'Impressora', descricao: 'Impressora de alta qualidade')
    ordem_de_servico = OrdemDeServico.create(cliente: cliente, equipamento: equipamento, descricao: 'Serviço de manutenção')
    historico = Historico.new(data: '2024-11-14', descricao: nil, ordem_de_servico: ordem_de_servico)
    expect(historico).to_not be_valid
  end

  it 'belongs to ordem_de_servico' do
    historico = Historico.reflect_on_association(:ordem_de_servico)
    expect(historico.macro).to eq(:belongs_to)
  end
end
