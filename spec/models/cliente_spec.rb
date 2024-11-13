require 'rails_helper'

RSpec.describe Cliente, type: :model do
  it 'is valid with valid attributes' do
    cliente = Cliente.new(nome: 'João Silva', email: 'joao@exemplo.com', telefone: '123456789')
    expect(cliente).to be_valid
  end

  it 'is invalid without a nome' do
    cliente = Cliente.new(nome: nil, email: 'joao@exemplo.com', telefone: '123456789')
    expect(cliente).to_not be_valid
  end

  it 'is invalid without an email' do
    cliente = Cliente.new(nome: 'João Silva', email: nil, telefone: '123456789')
    expect(cliente).to_not be_valid
  end

  it 'is invalid without a telefone' do
    cliente = Cliente.new(nome: 'João Silva', email: 'joao@exemplo.com', telefone: nil)
    expect(cliente).to_not be_valid
  end

  it 'is invalid with a duplicate email' do
    Cliente.create(nome: 'João Silva', email: 'joao@exemplo.com', telefone: '123456789')
    cliente = Cliente.new(nome: 'Maria Silva', email: 'joao@exemplo.com', telefone: '987654321')
    expect(cliente).to_not be_valid
  end
end
