# encoding: utf-8
require 'compra_goiaba'

describe CompraGoiaba do
  TEM_FOME     = true
  NAO_TEM_FOME = false

  before do
    @compra = CompraGoiaba.new
  end

  it 'deveria comprar a goiaba se tem fome e tem grana' do
    expect(@compra.pode_fazer?(2, TEM_FOME)).to be_truthy
  end

  it 'deveria não comprar goiaba se não tem grana' do
    expect(@compra.pode_fazer?(0, TEM_FOME)).to be_falsy
  end

  it 'deveria não comprar a goiaba se tem grana e não tem fome' do
    expect(@compra.pode_fazer?(0, NAO_TEM_FOME)).to be_falsy
  end
end