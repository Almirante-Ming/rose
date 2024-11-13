class HistoricosController < ApplicationController
  before_action :set_historico, only: [ :show, :update, :destroy ]

  # GET /historicos
  def index
    @historicos = Historico.all
    render json: @historicos
  end

  # GET /historicos/:id
  def show
    render json: @historico
  end

  # POST /historicos
  def create
    @historico = Historico.new(historico_params)
    if @historico.save
      render json: @historico, status: :created
    else
      render json: @historico.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /historicos/:id
  def update
    if @historico.update(historico_params)
      render json: @historico
    else
      render json: @historico.errors, status: :unprocessable_entity
    end
  end

  # DELETE /historicos/:id
  def destroy
    @historico.destroy
    head :no_content
  end

  private

  def set_historico
    @historico = Historico.find(params[:id])
  end

  def historico_params
    params.require(:historico).permit(:data, :descricao, :ordem_de_servico_id)
  end
end
