# encoding: utf-8
require 'brcpfcnpj'

class Fornecedor < ActiveRecord::Base
  validates :nome, presence: true
  usar_como_cpf :cpf
  usar_como_cnpj :cnpj
  validate :cpf_ou_cnpj
  
  def cpf_ou_cnpj
    if (cpf.present? and cnpj.present?) or
       (cpf.blank? and cnpj.blank?)
       errors[:base] << "use cpf ou cnpj"
    end  
  end 
 
end
