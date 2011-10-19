# encoding: utf-8
require 'spec_helper'

describe Fornecedor do
  
  it "não é válido sem nome" do
    Fornecedor.new(cnpj:'64431280000175').should be_invalid 
  end	

  it "valida cpf" do
  	Fornecedor.new(nome: 'Marcos', cpf:'23953977172').should be_valid
    Fornecedor.new(nome: 'Fulano', cpf:'1').should be_invalid
  end	

  it "valida cnpj" do
  	Fornecedor.new(nome: 'Empresa', cnpj:'64431280000175').should be_valid
    Fornecedor.new(nome: 'Fulano', cnpj:'1').should be_invalid
  end	

  it "não aceita cpf e cnpj juntos" do
    Fornecedor.new(nome: 'Empresa', cnpj:'64431280000175', cpf:'23953977172' ).should be_invalid
  end	

  it "não aceita cpf e cnpj vazios ao mesmo tempo" do
  	Fornecedor.new(nome: 'Apple').should be_invalid
  end	

  it "obriga cnpj se é pj" do
    Fornecedor.new(nome: 'Empresa', pj: true, cnpj:'64431280000175').should be_valid
    Fornecedor.new(nome: 'Empresa', pj: true, cpf:'23953977172').should be_invalid    
  end

end	