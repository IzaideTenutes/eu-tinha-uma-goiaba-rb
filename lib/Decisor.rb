require 'CompraGoiaba'
require 'CompraPassagem'

class Decisor
	attr_accessor :dinheiro_na_carteira, :estar_faminto

	def initialize(dinheiro_na_carteira, estar_faminto)
		self.dinheiro_na_carteira = dinheiro_na_carteira
		self.estar_faminto = estar_faminto
	end

	def decide
		decisao = []
		opcoes = [
			CompraGoiaba.new,
			CompraPassagem.new
		]
    
    opcoes.each do | opcao |
      if opcao.pode_fazer? dinheiro_na_carteira, estar_faminto
        paga opcao.valor 
        decisao << opcao.descricao
      end
    end

		decisao.join(" e ")
	end

	def paga(valor)
		self.dinheiro_na_carteira -= valor
	end
end