# encoding: utf-8
require 'decisor'
require 'compra_goiaba'
require 'compra_passagem'

describe "Integration" do
  TEM_FOME     = true
  NAO_TEM_FOME = false
  
  before do
    compraGoiaba   = CompraGoiaba.new 
    compraPassagem = CompraPassagem.new
    @opcoes        = [compraGoiaba, compraPassagem]
  end

  it "Se não tem grana, não compra a goiaba" do
    user = Decisor.new(0.50, NAO_TEM_FOME, @opcoes)

    expect(user.decide).to eq('')
  end

  it "Tem fome e tem grana, compra a goiaba" do
    user = Decisor.new(2, TEM_FOME, @opcoes)

    expect(user.decide).to eq('comprar goiaba')
  end

  it "Não tem fome e tem grana, não compra a goiaba e pega o onibus" do
    user = Decisor.new(2, NAO_TEM_FOME, @opcoes)

    expect(user.decide).to eq('comprar passagem')
  end

  it "Tem fome e não tem grana, não compra a goiaba" do
    user = Decisor.new(0.5, TEM_FOME, @opcoes)

    expect(user.decide).to eq('')
  end

  it "Compra a goiaba e pega onibus" do
    user = Decisor.new(10, TEM_FOME, @opcoes)

    expect(user.decide).to eq('comprar goiaba e comprar passagem')
  end
end