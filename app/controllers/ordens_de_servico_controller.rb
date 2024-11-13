class OrdensDeServicoController < ApplicationController
  before_action :set_ordem_de_servico, only: [ :show, :update, :destroy ]

  # GET /ordens_de_servico
  def index
    @ordens_de_servico = OrdemDeServico.all
    render json: @ordens_de_servico
  end

  # GET /ordens_de_servico/:id
  def show
    render json: @ordem_de_servico
  end

  # POST /ordens_de_servico
  def create
    @ordem_de_servico = OrdemDeServico.new(ordem_de_servico_params)
    if @ordem_de_servico.save
      render json: @ordem_de_servico, status: :created
    else
      render json: @ordem_de_servico.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ordens_de_servico/:id
  def update
    if @ordem_de_servico.update(ordem_de_servico_params)
      render json: @ordem_de_servico
    else
      render json: @ordem_de_servico.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ordens_de_servico/:id
  def destroy
    @ordem_de_servico.destroy
    head :no_content
  end

  private

  def set_ordem_de_servico
    @ordem_de_servico = OrdemDeServico.find(params[:id])
  end

  def ordem_de_servico_params
    params.require(:ordem_de_servico).permit(:descricao, :status, :cliente_id)
  end
end
