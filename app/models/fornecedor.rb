# encoding: utf-8
require 'brcpfcnpj'

class Fornecedor < ActiveRecord::Base
  has_many :conformidades

  validates :nome, presence: true
  validates :cnpj, presence: true, if: :pj?
  validates :cpf, presence: true, unless: :pj?
  usar_como_cpf :cpf
  usar_como_cnpj :cnpj
  validate :cpf_ou_cnpj
    
  def cpf_ou_cnpj
    if (cpf.present? and cnpj.present?) or
       (cpf.blank? and cnpj.blank?)
       errors[:base] << "informe cpf ou cnpj"
    end  
  end
  
 
end
