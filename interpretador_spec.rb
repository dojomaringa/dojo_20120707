require_relative "interpretador"

describe "Interpretador" do
  it "Operador avalia operacao >" do
    Interpretador.avalia("(> 1 2)").should == "false"
  end

  it "Operador avalia operacao +" do
    Interpretador.avalia("(+ 1 2 10 10 10)").should == "33"
  end

  it "Deve retornar array de tokens a partir de String" do
    Interpretador.tokens("(> 1 2)").should == [">", "1", "2"]
  end

  context "Metodo >" do
    it "Primeiro menor que o segundo deve retornar false" do
      Interpretador.>([1, 2]).should == false
    end

    it "Segundo menor que primeiro deve retornar true" do
      Interpretador.>([2, 1]).should == true
    end

    it "Dois valores iguais deve retornar false" do
      Interpretador.>([2, 2]).should == false
    end
  end

  context "Metodo ==" do
    it "Dois valores iguais deve retornar true" do
      Interpretador.==([2, 2]).should == true
    end
  end

  context "Metodo +" do
    it "Soma com dois operandos" do
      Interpretador.+([1, 2]).should == 3
    end

    it "Soma com tres operandos" do
      Interpretador.+([1, 2, 10]).should == 13
    end
  end
end