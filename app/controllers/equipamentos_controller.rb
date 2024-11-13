class EquipamentosController < ApplicationController
  before_action :set_equipamento, only: [ :show, :update, :destroy ]

  # GET /equipamentos
  def index
    @equipamentos = Equipamento.all
    render json: @equipamentos
  end

  # GET /equipamentos/:id
  def show
    render json: @equipamento
  end

  # POST /equipamentos
  def create
    @equipamento = Equipamento.new(equipamento_params)
    if @equipamento.save
      render json: @equipamento, status: :created
    else
      render json: @equipamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipamentos/:id
  def update
    if @equipamento.update(equipamento_params)
      render json: @equipamento
    else
      render json: @equipamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /equipamentos/:id
  def destroy
    @equipamento.destroy
    head :no_content
  end

  private

  def set_equipamento
    @equipamento = Equipamento.find(params[:id])
  end

  def equipamento_params
    params.require(:equipamento).permit(:nome, :descricao, :ordem_de_servico_id)
  end
end
