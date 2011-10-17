# encoding: utf-8
require 'spec_helper'

describe Fornecedor do
  it "válido com nome" do
    Fornecedor.new(nome: 'Apple').should be_valid
  end	
  it "não é válido sem nome" do
    Fornecedor.new.should be_invalid 
  end	

  it "valida cpf" do
  	Fornecedor.new(nome: 'Marcos', cpf:'23953977172').should be_valid
    Fornecedor.new(nome: 'Fulano', cpf:'1').should be_invalid
  end	

  it "valida cnpj" do
  	Fornecedor.new(nome: 'Empresa', cnpj:'64431280000175').should be_valid
    Fornecedor.new(nome: 'Fulano', cnpj:'1').should be_invalid
  end	
end	