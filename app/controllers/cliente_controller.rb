class ClienteController < ApplicationController
  
  def show
  	@cliente = Cliente.find(params[:id])
  end

  def new
    @pessoa = Pessoa.new
    @cliente = Cliente.new
  end

  def create
    @pessoa = Pessoa.new
    @pessoa.nome = params[:cliente][:pessoa]
    @pessoa.tipo = "cliente"
    @pessoa.save
    p = @pessoa.codpessoa
    @cliente = Cliente.new
    @cliente.usuario = params[:cliente][:usuario]
    @cliente.email = params[:cliente][:email]
    @cliente.senha = params[:cliente][:senha]
    @cliente.fkcodpessoa = p

    if @cliente.save
      sign_in @cliente
      redirect_to @cliente
    else
      render 'new'
    end
  end
end
