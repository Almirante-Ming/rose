require 'rails_helper'

RSpec.describe OrdensDeServicoController, type: :controller do
  let!(:cliente) { Cliente.create(nome: 'João', email: 'joao@example.com', telefone: '123456789') }
  let!(:ordem_de_servico) { OrdemDeServico.create(descricao: 'Serviço 1', status: 'Aberto', cliente: cliente) }

  describe 'GET #index' do
    it 'returns a list of ordens de serviço' do
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a single ordem de serviço' do
      get :show, params: { id: ordem_de_servico.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['descricao']).to eq(ordem_de_servico.descricao)
    end
  end

  describe 'POST #create' do
    it 'creates a new ordem de serviço' do
      post :create, params: { ordem_de_servico: { descricao: 'Serviço 2', status: 'Aberto', cliente_id: cliente.id } }
      expect(response).to have_http_status(:created)
      expect(OrdemDeServico.last.descricao).to eq('Serviço 2')
    end

    it 'returns an error if the ordem de serviço is invalid' do
      post :create, params: { ordem_de_servico: { descricao: '', status: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH #update' do
    it 'updates an ordem de serviço' do
      patch :update, params: { id: ordem_de_servico.id, ordem_de_servico: { status: 'Concluído' } }
      ordem_de_servico.reload
      expect(ordem_de_servico.status).to eq('Concluído')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes an ordem de serviço' do
      delete :destroy, params: { id: ordem_de_servico.id }
      expect(OrdemDeServico.exists?(ordem_de_servico.id)).to be_falsey
      expect(response).to have_http_status(:no_content)
    end
  end
end
