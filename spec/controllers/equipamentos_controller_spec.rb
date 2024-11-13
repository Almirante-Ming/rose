require 'rails_helper'

RSpec.describe EquipamentosController, type: :controller do
  let!(:cliente) { Cliente.create(nome: 'João', email: 'joao@example.com', telefone: '123456789') }
  let!(:ordem_de_servico) { OrdemDeServico.create(descricao: 'Serviço 1', status: 'Aberto', cliente: cliente) }
  let!(:equipamento) { Equipamento.create(nome: 'Equipamento 1', descricao: 'Descrição do equipamento', ordem_de_servico: ordem_de_servico) }

  describe 'GET #index' do
    it 'returns a list of equipamentos' do
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a single equipamento' do
      get :show, params: { id: equipamento.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['nome']).to eq(equipamento.nome)
    end
  end

  describe 'POST #create' do
    it 'creates a new equipamento' do
      post :create, params: { equipamento: { nome: 'Equipamento 2', descricao: 'Descrição do equipamento 2', ordem_de_servico_id: ordem_de_servico.id } }
      expect(response).to have_http_status(:created)
      expect(Equipamento.last.nome).to eq('Equipamento 2')
    end

    it 'returns an error if the equipamento is invalid' do
      post :create, params: { equipamento: { nome: '', descricao: '', ordem_de_servico_id: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH #update' do
    it 'updates an equipamento' do
      patch :update, params: { id: equipamento.id, equipamento: { nome: 'Equipamento Atualizado' } }
      equipamento.reload
      expect(equipamento.nome).to eq('Equipamento Atualizado')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes an equipamento' do
      delete :destroy, params: { id: equipamento.id }
      expect(Equipamento.exists?(equipamento.id)).to be_falsey
      expect(response).to have_http_status(:no_content)
    end
  end
end
