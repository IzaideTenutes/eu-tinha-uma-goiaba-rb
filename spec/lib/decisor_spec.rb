# encoding: utf-8

require 'decisor'

describe "Carinha da Goiaba:" do
  it "Se não tem grana, nao compra a goiaba" do
    user = Decisor.new(0.50, false)

    expect(user.decide).to match('')
  end

  it "Tem fome e tem grana, compra a goiaba" do
    user = Decisor.new(2, true)

    expect(user.decide).to eq('comprar goiaba')
  end

  it "Não tem fome e tem grana, não compra a goiaba e pega o onibus" do
    user = Decisor.new(2, false)

    expect(user.decide).to eq('comprar passagem')
  end

  it "Tem fome e não tem grana, não compra a goiaba" do
    user = Decisor.new(0.5, true)

    expect(user.decide).to match('')
  end

  it "Compra a goiaba e pega onibus" do
    user = Decisor.new(10, true)

    expect(user.decide).to match('comprar goiaba e comprar passagem')
  end
end