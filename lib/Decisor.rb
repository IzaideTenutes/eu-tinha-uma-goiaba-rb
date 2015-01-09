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

		compra_goiaba = CompraGoiaba.new
		compra_passagem = CompraPassagem.new

		if compra_goiaba.pode_fazer?(dinheiro_na_carteira, estar_faminto)
			paga(compra_goiaba.valor)
			decisao << compra_goiaba.descricao
		end
		
		if compra_passagem.pode_fazer?(dinheiro_na_carteira)
			paga(compra_passagem.valor)
			decisao << compra_passagem.descricao
		end
		
		decisao.join(" e ")
	end

	def paga(valor)
		self.dinheiro_na_carteira -= valor
	end
end