class CompraGoiaba
	attr_accessor :valor

	def initialize
		self.valor = 1.5
	end

	def pode_fazer?(dinheiro_na_carteira, estar_faminto)
		estar_faminto && self.valor <= dinheiro_na_carteira
	end

	def descricao
		'comprar goiaba'
	end
end