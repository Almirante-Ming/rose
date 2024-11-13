require 'rails_helper'

RSpec.describe HistoricosController, type: :controller do
  let!(:cliente) { Cliente.create(nome: 'João', email: 'joao@example.com', telefone: '123456789') }
  let!(:ordem_de_servico) { OrdemDeServico.create(descricao: 'Serviço 1', status: 'Aberto', cliente: cliente) }
  let!(:historico) { Historico.create(data: '2024-11-13', descricao: 'Histórico de serviço', ordem_de_servico: ordem_de_servico) }

  describe 'GET #index' do
    it 'returns a list of históricos' do
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a single histórico' do
      get :show, params: { id: historico.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['descricao']).to eq(historico.descricao)
    end
  end

  describe 'POST #create' do
    it 'creates a new histórico' do
      post :create, params: { historico: { data: '2024-11-14', descricao: 'Novo histórico de serviço', ordem_de_servico_id: ordem_de_servico.id } }
      expect(response).to have_http_status(:created)
      expect(Historico.last.descricao).to eq('Novo histórico de serviço')
    end

    it 'returns an error if the histórico is invalid' do
      post :create, params: { historico: { data: '', descricao: '', ordem_de_servico_id: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH #update' do
    it 'updates a histórico' do
      patch :update, params: { id: historico.id, historico: { descricao: 'Histórico Atualizado' } }
      historico.reload
      expect(historico.descricao).to eq('Histórico Atualizado')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a histórico' do
      delete :destroy, params: { id: historico.id }
      expect(Historico.exists?(historico.id)).to be_falsey
      expect(response).to have_http_status(:no_content)
    end
  end
end
