require 'rails_helper'

RSpec.describe ClientesController, type: :controller do
  let!(:cliente) { Cliente.create(nome: 'João', email: 'joao@example.com', telefone: '123456789') }

  describe 'GET #index' do
    it 'returns a list of clientes' do
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a single cliente' do
      get :show, params: { id: cliente.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['nome']).to eq(cliente.nome)
    end
  end

  describe 'POST #create' do
    it 'creates a new cliente' do
      post :create, params: { cliente: { nome: 'Maria', email: 'maria@example.com', telefone: '987654321' } }
      expect(response).to have_http_status(:created)
      expect(Cliente.last.nome).to eq('Maria')
    end

    it 'returns an error if the cliente is invalid' do
      post :create, params: { cliente: { nome: '', email: 'invalid', telefone: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH #update' do
    it 'updates a cliente' do
      patch :update, params: { id: cliente.id, cliente: { nome: 'João Atualizado' } }
      cliente.reload
      expect(cliente.nome).to eq('João Atualizado')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a cliente' do
      delete :destroy, params: { id: cliente.id }
      expect(Cliente.exists?(cliente.id)).to be_falsey
      expect(response).to have_http_status(:no_content)
    end
  end
end
