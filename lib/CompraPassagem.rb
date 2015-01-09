class CompraPassagem
	attr_accessor :valor

	def initialize
		self.valor = 1.5
	end

	def pode_fazer?(dinheiro_na_carteira)
 		self.valor <= dinheiro_na_carteira
	end

	def descricao
		'comprar passagem'
	end
end