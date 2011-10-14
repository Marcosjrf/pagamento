# encoding utf-8
class FornecedoresController < ApplicationController
  before_filter :authenticate_usuario!, except: [:index]
  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @fornecedores = Fornecedor.all
  
  end

  # GET /fornecedores/new
  # GET /fornecedores/new.json
  def new
    @fornecedor = Fornecedor.new
    
  end

  # GET /fornecedores/1/edit
  def edit
    @fornecedor = Fornecedor.find(params[:id])
  end

  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @fornecedor = Fornecedor.new(params[:fornecedor])

      if @fornecedor.save
        redirect_to fornecedores_path, notice: 'Fornecedor cadastrado com sucesso.' 
      else
        render action: "new" 
      end
  end

  # PUT /fornecedores/1
  # PUT /fornecedores/1.json
  def update
    @fornecedor = Fornecedor.find(params[:id])
    
      if @fornecedor.update_attributes(params[:fornecedor])
        redirect_to fornecedores_path, notice: 'Fornecedor alterado com sucesso.' 
      else
         render action: "edit" 
      end
  end

  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    @fornecedor = Fornecedor.find(params[:id])
    @fornecedor.destroy

    redirect_to fornecedores_path, notice: 'Fornecedor excluido com sucesso.'
      
  end
end
